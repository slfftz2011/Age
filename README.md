# Age

**一款基于历史时代的 Minecraft 生存进度数据包。**

[中文](#中文) | [English](#english)

---

## 中文

### 概述

**Age** 是一款 Minecraft 数据包，将生存模式转变为一趟穿越人类历史的旅程。你将从几乎一无所有的旧石器时代开始，历经 **14 个不同的时代**，每个时代都会解锁全新的配方、物品和游戏机制。

> ⚠️ **语言说明**：本数据包目前**仅支持中文**。所有游戏内文本、进度名称、任务描述和提示信息均为简体中文。暂不提供英文支持。

### 功能特性

#### 🏛️ 时代晋升系统
- **14 个历史时代**：旧石器 → 中石器 → 新石器 → 铜器 → 青铜 → 铁器前期/中期/后期 → 蒸汽时代 1~5
- 每个时代拥有独立的队伍、Boss 栏和晋升阈值
- 侧边栏显示“时代榜”

#### 🌡️ 体感温度系统
- **环境温度**：基于 9 类生物群系标签（极寒/寒冷/温和/温暖/炎热/下界/末地/潮湿/极湿）计算基础温度
- **天气修正**：晴天/下雨/雷暴影响体感温度，含天气持续计时器
- **装备修正**：金属护甲（头盔/胸甲/护腿/靴子）影响体感温度
- **热源/冷源检测**：自动检测玩家周围 3×3×3 范围内的热源/冷源方块，按距离衰减计算温度贡献
- **温度负面效果**：
  - 🔥 中暑（heatstroke）— 高温状态
  - 🔥 灼烧（scorch）— 极高温
  - ❄️ 寒战（chill）— 低温状态
  - ❄️ 冰冻（frozen）— 极低温

#### 💧 口渴值系统
- **6 类水源/补水食物**：
  - 脏水（低补水 + 负面效果风险）
  - 清水（中等补水）
  - 净化水（高补水）
  - 补水食物（食物类补水）
  - 多汁食物（高水分食物）
  - 提神食物（补水 + 状态恢复）
- **脱水负面效果**：干旱 → 脱水 → 干燥 → 饥渴
- 中暑与口渴值联动：脱水状态下中暑效果增强

#### 📋 任务系统
- **五类随机委托任务**：
  - 狩猎（hunt）— 击杀 12 种怪物
  - 捕获（fish）— 击杀 6 种鱼类
  - 食用（eat）— 消耗 17 种食物
  - 制作（craft）— 合成 6 种物品
  - 采掘（mine）— 挖掘 9 种方块
  - 围剿（suppress）— 12 种排除逻辑
- **主线任务**：旧石器时代 5 个阶段，含 track / unlock / complete 全套
- **分支任务**：旧石器时代 3 条分支线
- **进度树**：28 个进度文件构成完整旧石器时代进度树

#### 🎒 背包锁定
- 旧石器时代禁用高级物品，随时代晋升逐步解锁
- 容器交互控制（视线锁定 / 半径解锁）
- 配方锁定（移除高级配方）

### 下载说明

项目通过 GitHub Actions **每日自动构建**预发布版本[reference:0]。每次构建产出以下文件：

| 文件 | 类型 | 说明 |
|------|------|------|
| `Age-Data-*-generic.zip` | 数据包·通用版 | 已移除 `data/c/`，纯原版可用 |
| `Age-Data-*-compat.zip` | 数据包·兼容版 | 保留 `data/c/`，需 Fabric API / NeoForge |
| `Age-Assets-*.zip` | 资源包 | 自定义材质、模型、音效 |

> ⚠️ **注意**：预发布版本未经充分测试，不保证可用性。请谨慎使用。[reference:1]

### 安装方法

**数据包：**
1. 下载 `Age-Data-*.zip`
2. 放入存档的 `datapacks/` 文件夹
3. 运行 `/reload` 或重启世界
4. 数据包将自动初始化

**资源包：**
1. 下载 `Age-Assets-*.zip`
2. 放入 `resourcepacks/` 文件夹
3. 在游戏设置中启用

### 支持版本

| 平台 | 版本 |
|------|------|
| Minecraft | 1.21.10 |
| 数据包格式 | 88.0 ~ 88.33 |

### 开发工具

项目包含基于 Python 的工具链：

- **`pack.py`** — 打包工具：宏替换 + JSON 压缩 + mcfunction 去注释/折叠多行 → 输出 zip
- **`check.py`** — 综合检查工具：记分板注册/使用一致性、标签/谓词/进度/函数/战利品表引用完整性、JSON/NBT 语法
- **`python\*`** — 其他Python辅助开发脚本

CI 工作流：
- `check.yml` — push/PR 时运行 `check.py --strict`
- `pack.yml` — 每日定时 + 手动触发，打包并发布 Pre-Release
- `_gen.yml` — 手动触发热源/冷源检测函数自动生成

### 链接

- [GitHub 仓库](https://github.com/slfftz2011/Age)
- [Issue 反馈](https://github.com/slfftz2011/Age/issues)
- [最新构建](https://github.com/slfftz2011/Age/releases)

### 许可证

MIT License

---

## English

### Overview

**Age** is a Minecraft datapack that transforms survival into a journey through human history. You start in the Old Stone Age with almost nothing, and progress through **14 distinct eras** — each unlocking new recipes, items, and gameplay mechanics.

> ⚠️ **Language Notice**: This datapack is currently **Chinese-only**. All in-game text, advancement names, task descriptions, and messages are in Simplified Chinese. English support is not yet available.

### Features

#### 🏛️ Age Progression System
- **14 Historical Ages**: Old Stone → Mid Stone → New Stone → Copper → Bronze → Pre-Iron → Mid-Iron → Late-Iron → Steam Ages 1~5
- Each age has its own team, bossbar, and progression threshold
- Sidebar displays an "Age Board"

#### 🌡️ Body Temperature System
- **Environmental Temperature**: Based on 9 biome categories (freezing/cold/temperate/warm/hot/nether/end/humid/very_humid)
- **Weather Modifiers**: Sunny/rain/thunder affects temperature, with weather duration timer
- **Equipment Modifiers**: Metal armor (helmet/chestplate/leggings/boots) affects perceived temperature
- **Heat/Cold Source Detection**: Automatically detects heat/cold source blocks within a 3×3×3 radius, with distance-based attenuation
- **Temperature Debuffs**:
  - 🔥 Heatstroke — High temperature
  - 🔥 Scorch — Extreme heat
  - ❄️ Chill — Low temperature
  - ❄️ Frozen — Extreme cold

#### 💧 Thirst System
- **6 Water/Food Hydration Types**:
  - Dirty Water (low hydration + debuff risk)
  - Clear Water (medium hydration)
  - Purified Water (high hydration)
  - Hydrating Food (food-based hydration)
  - Juicy Food (high-moisture food)
  - Refreshing Food (hydration + status recovery)
- **Dehydration Debuffs**: Arid → Dehydrate → Dry → Famish
- Heatstroke synergizes with thirst: dehydration amplifies heatstroke effects

#### 📋 Task System
- **5 Random Commission Types**:
  - Hunt — Kill 12 monster types
  - Fish — Catch 6 fish types
  - Eat — Consume 17 food types
  - Craft — Craft 6 item types
  - Mine — Mine 9 block types
  - Suppress — 12 exclusion logics
- **Main Quests**: Old Stone Age has 5 phases with track/unlock/complete functions
- **Branch Quests**: 3 branch lines for the Old Stone Age
- **Advancement Tree**: 28 advancement files forming a complete Old Stone Age tree

#### 🎒 Backpack Locking
- Advanced items are disabled in the Old Stone Age and unlock as you progress
- Container interaction control (line-of-sight locking / radius unlocking)
- Recipe locking (removes advanced recipes)

### Downloads

Pre-release builds are generated **daily** via GitHub Actions[reference:2]. Each build produces:

| File | Type | Description |
|------|------|-------------|
| `Age-Data-*-generic.zip` | Datapack · Generic | `data/c/` removed, works in vanilla |
| `Age-Data-*-compat.zip` | Datapack · Compat | Retains `data/c/`, requires Fabric API / NeoForge |
| `Age-Assets-*.zip` | Resource Pack | Custom textures, models, sounds |

> ⚠️ **Note**: Pre-release builds are not fully tested and may not work as expected. Use with caution.[reference:3]

### Installation

**Datapack:**
1. Download `Age-Data-*.zip`
2. Place it in your world's `datapacks/` folder
3. Run `/reload` or restart the world
4. The datapack initializes automatically

**Resource Pack:**
1. Download `Age-Assets-*.zip`
2. Place it in `resourcepacks/` folder
3. Enable it in game settings

### Supported Versions

| Platform | Version |
|----------|---------|
| Minecraft | 1.21.10 |
| Pack Format | 88.0 ~ 88.33 |

### Development Tools

Python-based toolchain:

- **`pack.py`** — Packaging tool: macro replacement + JSON compression + mcfunction processing
- **`check.py`** — Comprehensive validation: scoreboard, tags, predicates, advancements, functions, loot tables, JSON/NBT syntax
- **`hot_cold.py`** — Heat/cold source detection function auto-generator

CI Workflows:
- `check.yml` — Runs `check.py --strict` on push/PR
- `pack.yml` — Daily scheduled + manual trigger, packages and publishes Pre-Release
- `_gen.yml` — Manual trigger for heat/cold source function auto-generation

### Links

- [GitHub Repository](https://github.com/slfftz2011/Age)
- [Issue Tracker](https://github.com/slfftz2011/Age/issues)
- [Latest Builds](https://github.com/slfftz2011/Age/releases)

### License

MIT License
