import json
import os

def generate_mcfunctions(config_path, output_dir="data"):
    with open(config_path, 'r', encoding='utf-8') as f:
        config = json.load(f)

    era = config["era"]
    namespace = config["namespace"]
    base_path = namespace.replace(":", "/")
    full_base = os.path.join(output_dir, base_path)

    type_map = {t["id"]: t for t in config["types"]}
    all_tasks = []

    for task in config["tasks"]:
        task_id = task["id"]
        task_type = task["type"]
        type_info = type_map[task_type]
        type_name = type_info["name"]
        color = type_info["color"]
        team_scope = type_info["team_scope"]
        criterion = type_info["criterion"]
        icon = type_info.get("icon", "")

        task_name = task["name"]
        display_name = task["display"]
        target = task["target"]
        reward = task["reward"]

        main_content = task.get("main_content")
        contents = task.get("contents", [])

        if main_content and contents:
            raise ValueError(f"任务 {task_id} 不能同时有 main_content 和 contents")
        if not main_content and not contents:
            raise ValueError(f"任务 {task_id} 必须指定 main_content 或 contents")

        # 主计分板
        main_sb = {
            "name": f"{task_name}_{task_type}",
            "criterion": f"minecraft.{criterion}:minecraft.{main_content}" if main_content else "dummy",
            "display": f"{type_name}{display_name}",
            "main": True
        }
        scoreboards = [main_sb]

        # updata
        updata_sb = {"name": f"{task_name}_updata", "criterion": "dummy", "updata": True}
        scoreboards.append(updata_sb)

        # all
        all_sb = None
        if team_scope == "team":
            all_sb = {"name": f"{task_name}_all", "criterion": "dummy", "all": True}
            scoreboards.append(all_sb)

        # 子计分板
        sub_sbs = []
        for content in contents:
            sub = {
                "name": f"{task_name}_{content}",
                "criterion": f"minecraft.{criterion}:minecraft.{content}",
            }
            sub_sbs.append(sub)
            scoreboards.append(sub)

        task_info = {
            "id": task_id,
            "type": task_type,
            "task_name": task_name,
            "display_name": display_name,
            "target": target,
            "reward": reward,
            "main_sb": main_sb,
            "updata_sb": updata_sb,
            "all_sb": all_sb,
            "sub_sbs": sub_sbs,
            "scoreboards": scoreboards,
            "team_scope": team_scope,
            "color": color,
            "type_name": type_name,
            "is_collection": (not main_content and contents),
            "icon": icon
        }
        all_tasks.append(task_info)

        # ----- 生成 {id}.mcfunction -----
        type_path = os.path.join(full_base, "random", task_type)
        os.makedirs(type_path, exist_ok=True)

        lines = []
        if team_scope == "personal":
            # 个人任务逻辑
            if task_info["is_collection"]:
                for sub in sub_sbs:
                    lines.append(f"scoreboard players operation @s {main_sb['name']} += @s {sub['name']}")
            lines.append(f'execute unless entity @s[tag=task_done] unless score @s {main_sb["name"]} = @s {updata_sb["name"]} run title @s actionbar ["",{{"text":"{icon} ","color":"{color}"}},{{"text":"{type_name}: {display_name} ","color":"{color}"}},{{"score":{{"name":"@s","objective":"{main_sb["name"]}"}},"color":"gray"}},{{"text":"/{target}","color":"gray"}}]')
            lines.append(f"execute unless entity @s[tag=task_done] unless score @s {main_sb['name']} = @s {updata_sb['name']} run tag @s add actionbar_block")
            lines.append(f"scoreboard players operation @s {updata_sb['name']} = @s {main_sb['name']}")
            lines.append(f"execute as @s unless entity @s[tag=task_done] if score @s {main_sb['name']} matches {target}.. run function {namespace}/random/{task_type}/{task_id}_c")
        else:
            # 队伍共享任务逻辑
            all_sb_name = all_sb['name']
            main_sb_name = main_sb['name']
            # 清零汇总板（如果未完成）
            lines.append(f"execute unless score {era} {all_sb_name} matches {target}.. run scoreboard players set {era} {all_sb_name} 0")
            # 累加所有队员的个人计分板到汇总板
            lines.append(f"execute unless score {era} {all_sb_name} matches {target}.. as @a[team={era}] run scoreboard players operation {era} {all_sb_name} += @s {main_sb_name}")
            # 更新 Bossbar
            lines.append(f'bossbar set {era} name ["当前时代 - ", {{text:"旧石器时代",color:"#424529"}}, "   当前任务 - ", {{text:"[{type_name}] 共同击杀 {display_name} ",color:"{color}"}}, {{score:{{name:"{era}",objective:"{all_sb_name}"}},color:"gray"}}, {{text:"/{target}",color:"gray"}}]')
            # 检测达标，选择第一个未完成的玩家执行完成函数
            lines.append(f'execute as @a[team={era},tag=!task_done,limit=1] if score {era} {all_sb_name} matches {target}.. run function {namespace}/random/{task_type}/{task_id}_c')

        with open(os.path.join(type_path, f"{task_id}.mcfunction"), 'w', encoding='utf-8') as f:
            f.write("\n".join(lines))

        # ----- 生成 {id}_c.mcfunction (完成回调) -----
        complete_lines = [
            f"playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5",
            f"execute if entity @s[team={era}] run scoreboard players add {era} stage {reward}",
            f"tellraw @a [\"\",{{\"text\":\"恭喜玩家 \",\"color\":\"#aaddaa\"}},{{\"type\":\"selector\",\"selector\":\"@s\"}},{{\"text\":\" 完成了委托 \",\"color\":\"#aaddaa\"}},{{\"text\":\"{type_name}: {display_name} x{target}\",\"color\":\"{color}\"}},{{\"text\":\" !\",\"color\":\"#aaddaa\"}}]",
            f"tellraw @a {{\"text\":\"时代进度 +{reward}! \",\"color\":\"#aaddaa\"}}",
            f"tag @s add task_done"
        ]
        with open(os.path.join(type_path, f"{task_id}_c.mcfunction"), 'w', encoding='utf-8') as f:
            f.write("\n".join(complete_lines))

    # ----- 生成 check.mcfunction -----
    check_lines = ["# ===== 任务入口分配 ====="]
    type_groups = {}
    for t in all_tasks:
        type_groups.setdefault(t["type"], []).append(t)

    for type_id, tasks in type_groups.items():
        is_team = tasks[0]["team_scope"] == "team"
        check_lines.append(f"# ----- {tasks[0]['type_name']}任务{'（队伍共享）' if is_team else '（个人）'} -----")
        for t in tasks:
            if is_team:
                check_lines.append(f"execute if score {era} task matches {t['id']} run function {namespace}/random/{type_id}/{t['id']}")
            else:
                check_lines.append(f"execute if score {era} task matches {t['id']} as @a[team={era}] run function {namespace}/random/{type_id}/{t['id']}")
    with open(os.path.join(full_base, "check.mcfunction"), 'w', encoding='utf-8') as f:
        f.write("\n".join(check_lines))

    # ----- 生成 roll.mcfunction -----
    max_id = config["max_task_id"]
    roll_lines = ["# ===== 删除旧任务计分板（主 → updata/all → 子） ====="]

    for t in all_tasks:
        roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives remove {t['main_sb']['name']}")
        roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives remove {t['updata_sb']['name']}")
        if t['all_sb']:
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives remove {t['all_sb']['name']}")
        for sub in t['sub_sbs']:
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives remove {sub['name']}")

    roll_lines.append("")
    roll_lines.append(f"execute store result score {era} task run random value 0..{max_id}")
    roll_lines.append("")
    roll_lines.append("# ===== 根据新任务创建计分板（主 → updata/all → 子） =====")

    for t in all_tasks:
        main = t['main_sb']
        if main['criterion'] == "dummy":
            cmd = f"execute if score {era} task matches {t['id']} run scoreboard objectives add {main['name']} dummy \"{main['display']}\""
        else:
            cmd = f"execute if score {era} task matches {t['id']} run scoreboard objectives add {main['name']} {main['criterion']} \"{main['display']}\""
        roll_lines.append(cmd)

        up = t['updata_sb']
        roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives add {up['name']} dummy")

        if t['all_sb']:
            all_sb = t['all_sb']
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives add {all_sb['name']} dummy")

        for sub in t['sub_sbs']:
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives add {sub['name']} {sub['criterion']}")

    with open(os.path.join(full_base, "roll.mcfunction"), 'w', encoding='utf-8') as f:
        f.write("\n".join(roll_lines))

    # ----- 生成 show.mcfunction -----
    show_lines = [
        "# ===== 任务分配后更新 Bossbar 初始名称 =====",
        "# ----- 无任务 -----",
        f'execute if score {era} task matches 0 run bossbar set {era} name ["当前时代 - ", {{text:"旧石器时代",color:"#424529"}}, " 当前任务 - ", {{text:"无",color:"gray"}}]',
    ]
    for t in all_tasks:
        display_text = f"[{t['type_name']}] {t['display_name']} x{t['target']}"
        if t["team_scope"] == "team":
            display_text = f"[{t['type_name']}] 共同击杀 {t['display_name']} 0/{t['target']}"
        show_lines.append(f'execute if score {era} task matches {t["id"]} run bossbar set {era} name ["当前时代 - ", {{text:"旧石器时代",color:"#424529"}}, " 当前任务 - ", {{text:"{display_text}",color:"{t["color"]}"}}]')
    with open(os.path.join(full_base, "show.mcfunction"), 'w', encoding='utf-8') as f:
        f.write("\n".join(show_lines))

    print(f"✅ 成功生成 {len(all_tasks)} 个任务的全部函数文件")
    print(f"📁 输出目录: {full_base}")

if __name__ == "__main__":
    generate_mcfunctions("old_stone_age.json")