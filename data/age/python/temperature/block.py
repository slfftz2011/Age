#!/usr/bin/env python3
import math
from pathlib import Path

TAG_STRENGTH = {
    "hot_strong": 20,
    "hot_medium": 12,
    "hot_medium_lit": 12,
    "hot_weak": 4,
    "cold_strong": -12,
    "cold_medium": -8,
    "cold_weak": -3,
}

RANGE = 3
CONTACT_DIST = 1.0
OUTPUT = Path("function/state/temperature/env/block.mcfunction")


def safe_round(x):
    return math.floor(x + 0.5) if x >= 0 else -math.floor(-x + 0.5)


def generate():
    lines = ["# ===== 热源/冷源检测（自动生成） =====", ""]
    for dx in range(-RANGE, RANGE + 1):
        for dy in range(-RANGE, RANGE + 1):
            for dz in range(-RANGE, RANGE + 1):
                dist = math.sqrt(dx * dx + dy * dy + dz * dz)
                if dist > RANGE:          # 允许边界
                    continue
                factor = 1.0 if dist <= CONTACT_DIST else 1.0 / (dist * 2)
                if factor < 0.1:
                    continue
                for tag, strength in TAG_STRENGTH.items():
                    value = safe_round(strength * factor)
                    if value == 0:
                        continue
                    if "lit" in tag:
                        spec = f"#age:{tag}[lit=true]"
                    else:
                        spec = f"#age:{tag}"
                    cmd = (
                        f"execute at @s if block ~{dx} ~{dy} ~{dz} "
                        f"{spec} run scoreboard players"
                    )
                    if value > 0:
                        lines.append(f"{cmd} add @s env_temp {value}")
                    else:
                        lines.append(f"{cmd} remove @s env_temp {-value}")
    lines.append("")
    lines.append("execute if score @s env_temp matches 51.. run scoreboard players set @s env_temp 50")
    lines.append("execute if score @s env_temp matches ..-41 run scoreboard players set @s env_temp -40")
    return "\n".join(lines)


if __name__ == "__main__":
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT, "w", encoding="utf-8") as f:
        f.write(generate())
    print(f"生成完成：{OUTPUT}")