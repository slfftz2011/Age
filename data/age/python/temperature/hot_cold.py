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
OUTPUT = Path("function/state/temperature/hot_cold.mcfunction")

def generate():
    lines = ["# ===== 热源/冷源检测（自动生成） =====", ""]
    for dx in range(-RANGE, RANGE+1):
        for dy in range(-RANGE, RANGE+1):
            for dz in range(-RANGE, RANGE+1):
                if dx == 0 and dy == 0 and dz == 0:
                    continue
                dist = math.sqrt(dx*dx + dy*dy + dz*dz)
                if dist >= RANGE:
                    continue
                factor = 1.0 if dist <= CONTACT_DIST else 1.0 / (dist * 2)
                if factor < 0.1:
                    continue
                for tag, strength in TAG_STRENGTH.items():
                    value = round(strength * factor)
                    if value == 0:
                        continue
                    if tag.find("lit") != -1:
                        cmd = f"execute if block ~{dx} ~{dy} ~{dz} #age:{tag}[lit=true] run scoreboard players"
                    else:
                        cmd = f"execute if block ~{dx} ~{dy} ~{dz} #age:{tag} run scoreboard players"
                    if value > 0:
                        lines.append(f"{cmd} add @s env_temp {value}")
                    else:
                        lines.append(f"{cmd} remove @s env_temp {-value}")
    lines.append("")
    lines.append("execute if score @s env_temp matches 81.. run scoreboard players set @s env_temp 80")
    lines.append("execute if score @s env_temp matches ..-1 run scoreboard players set @s env_temp 0")
    return "\n".join(lines)

if __name__ == "__main__":
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT, "w") as f:
        f.write(generate())
    print(f"生成完成：{OUTPUT}")
