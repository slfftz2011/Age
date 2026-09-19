import json
import os
import argparse


def generate_mcfunctions(config_path, output_dir):
    with open(config_path, 'r', encoding='utf-8') as f:
        config = json.load(f)

    era = config["era"]
    era_display = config.get("era_display", era)  # 时代显示名，缺省回退到 era
    namespace = config["namespace"]

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
        xp_reward = reward // 2

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

        # updata 计分板（仅个人任务需要）
        updata_sb = None
        if team_scope == "personal":
            updata_sb = {"name": f"{task_name}_updata", "criterion": "dummy", "updata": True}
            scoreboards.append(updata_sb)

        # all 计分板（仅团队任务需要）
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
            "xp_reward": xp_reward,
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

        type_path = os.path.join(output_dir, "random", task_type)
        os.makedirs(type_path, exist_ok=True)

        # ===== {id}.mcfunction =====
        if team_scope == "team":
            lines = [
                f"# ===== {type_name}：{display_name} x{target}（队伍共享）=====",
                "",
                "# 仅在未完成时清零汇总板",
                f"execute unless score {era} {all_sb['name']} matches {target}.. run scoreboard players set {era} {all_sb['name']} 0",
                "",
                "# 仅在未完成时累加个人击杀到队伍汇总板",
                f"execute unless score {era} {all_sb['name']} matches {target}.. as @a[team={era}] run scoreboard players operation {era} {all_sb['name']} += @s {main_sb['name']}",
                "",
                "# 更新 Bossbar 名称",
                f'bossbar set {era} name ["当前时代 - ", {{text:"{era_display}",color:"#424529"}}, "   当前任务 - ", {{text:"[{type_name}] 共同击杀 {display_name} ",color:"{color}"}}, {{score:{{name:"{era}",objective:"{all_sb["name"]}"}}}}, {{text:"/{target}",color:"gray"}}]',
                "",
                "# 仅在未完成时检测是否达到目标",
                f"execute unless entity @a[team={era},tag=task_done] if score {era} {all_sb['name']} matches {target}.. run function {namespace}/random/{task_type}/{task_id}_c"
            ]
        else:
            lines = []
            if task_info["is_collection"]:
                for sub in sub_sbs:
                    lines.append(f"scoreboard players operation @s {main_sb['name']} += @s {sub['name']}")

            lines.append(f'execute unless entity @s[tag=task_done] unless score @s {main_sb["name"]} = @s {updata_sb["name"]} run title @s actionbar ["",{{"text":"{icon} ","color":"{color}"}},{{"text":"{type_name}: {display_name} ","color":"{color}"}},{{"score":{{"name":"@s","objective":"{main_sb["name"]}"}},"color":"gray"}},{{"text":"/{target}","color":"gray"}}]')
            lines.append(f"execute unless entity @s[tag=task_done] unless score @s {main_sb['name']} = @s {updata_sb['name']} run tag @s add actionbar_block")
            lines.append(f"scoreboard players operation @s {updata_sb['name']} = @s {main_sb['name']}")
            lines.append(f"execute as @s unless entity @s[tag=task_done] if score @s {main_sb['name']} matches {target}.. run function {namespace}/random/{task_type}/{task_id}_c")

        with open(os.path.join(type_path, f"{task_id}.mcfunction"), 'w', encoding='utf-8') as f:
            f.write("\n".join(lines))

        # ===== {id}_c.mcfunction =====
        if team_scope == "team":
            complete_lines = [
                f"playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.5",
                f"execute if entity @a[team={era}] run scoreboard players add {era} stage {reward}",
                f"xp add @a[team={era}] {xp_reward}",
                f'tellraw @a ["",{{text:"恭喜队伍 ",color:"#aaddaa"}},{{text:"{era_display}",color:"#424529"}},{{text:" 完成了委托 ",color:"#aaddaa"}},{{text:"{type_name}: {display_name} x{target}",color:"{color}"}},{{text:" !",color:"#aaddaa"}}]',
                f'tellraw @a {{text:"时代进度 +{reward}! ",color:"#aaddaa"}}',
                f"tag @a[team={era}] add task_done"
            ]
        else:
            complete_lines = [
                f"playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5",
                f"execute if entity @s[team={era}] run scoreboard players add {era} stage {reward}",
                f'tellraw @a ["",{{text:"恭喜玩家 ",color:"#aaddaa"}},{{type:"selector",selector:"@s"}},{{text:" 完成了委托 ",color:"#aaddaa"}},{{text:"{type_name}: {display_name} x{target}",color:"{color}"}},{{text:" !",color:"#aaddaa"}}]',
                f'tellraw @a {{text:"时代进度 +{reward}! ",color:"#aaddaa"}}',
                f"tag @s add task_done"
            ]

        with open(os.path.join(type_path, f"{task_id}_c.mcfunction"), 'w', encoding='utf-8') as f:
            f.write("\n".join(complete_lines))

    # ===== check.mcfunction =====
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

    with open(os.path.join(output_dir, "check.mcfunction"), 'w', encoding='utf-8') as f:
        f.write("\n".join(check_lines))

    # ===== roll.mcfunction =====
    max_id = config["max_task_id"]
    roll_lines = ["# ===== 删除旧任务计分板（主 → updata/all → 子） ====="]

    for t in all_tasks:
        roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives remove {t['main_sb']['name']}")
        if t['updata_sb']:
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

        if t['updata_sb']:
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives add {t['updata_sb']['name']} dummy")
        if t['all_sb']:
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives add {t['all_sb']['name']} dummy")

        for sub in t['sub_sbs']:
            roll_lines.append(f"execute if score {era} task matches {t['id']} run scoreboard objectives add {sub['name']} {sub['criterion']}")

    with open(os.path.join(output_dir, "roll.mcfunction"), 'w', encoding='utf-8') as f:
        f.write("\n".join(roll_lines))

    # ===== show.mcfunction =====
    show_lines = [
        "# ===== 任务分配后更新 Bossbar 初始名称 =====",
        "# ----- 无任务 -----",
        f'execute if score {era} task matches 0 run bossbar set {era} name ["当前时代 - ", {{text:"{era_display}",color:"#424529"}}, " 当前任务 - ", {{text:"无",color:"gray"}}]',
    ]
    for t in all_tasks:
        display_text = f"[{t['type_name']}] {t['display_name']} x{t['target']}"
        if t["team_scope"] == "team":
            display_text = f"[{t['type_name']}] 共同击杀 {t['display_name']} 0/{t['target']}"
        show_lines.append(f'execute if score {era} task matches {t["id"]} run bossbar set {era} name ["当前时代 - ", {{text:"{era_display}",color:"#424529"}}, " 当前任务 - ", {{text:"{display_text}",color:"{t["color"]}"}}]')

    with open(os.path.join(output_dir, "show.mcfunction"), 'w', encoding='utf-8') as f:
        f.write("\n".join(show_lines))

    print(f"✅ 成功生成 {len(all_tasks)} 个任务的全部函数文件")
    print(f"📁 输出目录: {output_dir}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="根据 JSON 配置生成 Minecraft 函数文件")
    parser.add_argument("config", help="JSON 配置文件的路径")
    parser.add_argument("-o", "--output", default="data", help="输出根目录（默认: data）")
    args = parser.parse_args()

    generate_mcfunctions(args.config, args.output)