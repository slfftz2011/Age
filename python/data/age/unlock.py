import math

def generate_unlock_function():
    radius_min = 6
    radius_max = 7
    commands = []
    for dx in range(-radius_max, radius_max + 1):
        for dy in range(-radius_max, radius_max + 1):
            for dz in range(-radius_max, radius_max + 1):
                dist = math.sqrt(dx*dx + dy*dy + dz*dz)
                if radius_min <= dist <= radius_max:
                    commands.append(f'execute positioned ~{dx} ~{dy} ~{dz} if block ~ ~ ~ #c:chests run data remove block ~ ~ ~ lock')
    return commands

if __name__ == '__main__':
    cmds = generate_unlock_function()
    with open('unlock_radius.mcfunction', 'w', encoding='utf-8') as f:
        f.write('# 旧石器玩家周围空心球壳（6~7格）容器解锁\n')
        f.write('# 总共 {} 条命令\n'.format(len(cmds)))
        for cmd in cmds:
            f.write(cmd + '\n')
    print(f'生成 {len(cmds)} 条命令')