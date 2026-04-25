# PCL Neo Forged 开发文档

## 项目概述

PCL Neo Forged 是一个基于原版 [PCL2](https://github.com/Meloong-Git/PCL/) fork 的 Minecraft 启动器，采用 VB.NET + WPF 技术栈开发。

### 技术栈

- **语言**: Visual Basic .NET (VB.NET)
- **框架**: WPF (Windows Presentation Foundation)
- **目标框架**: .NET Framework 4.6.2
- **构建系统**: MSBuild
- **持续集成**: GitHub Actions
- **依赖管理**: NuGet (部分) + 内嵌 DLL

***

## 项目结构

```
PCL_NeoForged-main/
├── .github/
│   └── workflows/
│       └── build.yml          # CI/CD 构建流程
├── Plain Craft Launcher 2/
│   ├── Controls/              # 自定义 WPF 控件
│   │   ├── Behaviors/          # 行为类
│   │   ├── MyMsg/              # 消息对话框组件
│   │   └── [My*.vb/xaml]       # 各种自定义控件
│   ├── Modules/                # 核心业务逻辑模块
│   │   ├── Base/               # 基础模块
│   │   │   ├── ModBase.vb      # 全局基础函数与常量
│   │   │   ├── ModLoader.vb    # 启动器加载逻辑
│   │   │   ├── ModNet.vb       # 网络请求封装
│   │   │   ├── ModValidate.vb  # 验证相关
│   │   │   ├── ModAnimation.vb # 动画系统
│   │   │   └── MyBitmap.vb     # 图片处理
│   │   ├── Minecraft/          # Minecraft 相关
│   │   │   ├── ModLaunch.vb    # 游戏启动逻辑
│   │   │   ├── ModDownload.vb  # 下载模块
│   │   │   ├── ModJava.vb      # Java 管理
│   │   │   ├── ModMinecraft.vb # Minecraft 核心
│   │   │   ├── ModMod.vb       # Mod 管理
│   │   │   ├── ModModpack.vb   # 整合包管理
│   │   │   ├── ModComp.vb      # 组件管理
│   │   │   ├── ModCrash.vb     # 崩溃处理
│   │   │   └── ModWatcher.vb   # 文件监控
│   │   ├── ThirdParty/         # 第三方集成
│   │   ├── ModMain.vb          # 主程序入口与提示系统
│   │   ├── ModEvent.vb        # 事件系统
│   │   ├── ModMusic.vb        # 音乐播放
│   │   └── ModSecret.vb        # 密钥管理
│   ├── Pages/                  # 页面 UI
│   │   ├── PageDownload/        # 下载页面
│   │   ├── PageInstance/       # 实例管理页面
│   │   ├── PageLaunch/         # 启动页面
│   │   ├── PageLink/           # 链接页面
│   │   ├── PageOther/          # 其他页面 (帮助、关于)
│   │   └── PageSetup/          # 设置页面
│   ├── Resources/              # 资源文件
│   │   ├── *.dll               # 第三方依赖库
│   │   ├── Font.ttf            # 字体文件
│   │   └── [其他资源]
│   ├── Images/                  # 图片资源
│   │   ├── Blocks/             # Minecraft 方块图片
│   │   ├── Heads/             # 头像图片
│   │   ├── Icons/              # 图标
│   │   ├── Skins/              # 皮肤图片
│   │   └── Themes/             # 主题背景
│   ├── My Project/             # VB.NET 项目配置
│   │   ├── AssemblyInfo.vb
│   │   ├── Resources.resx
│   │   └── Settings.settings
│   ├── Application.xaml         # 程序入口
│   ├── FormMain.xaml           # 主窗口
│   └── Plain Craft Launcher 2.vbproj  # 项目文件
├── Plain Craft Launcher 2.sln   # 解决方案文件
└── README.md                    # 项目说明
```

***

## 模块说明

### 核心模块

| 模块      | 文件                | 功能描述             |
| ------- | ----------------- | ---------------- |
| 基础模块    | `ModBase.vb`      | 全局常量、路径管理、工具函数   |
| 启动逻辑    | `ModLaunch.vb`    | Minecraft 游戏启动核心 |
| 下载管理    | `ModDownload.vb`  | 资源下载与进度跟踪        |
| Java 管理 | `ModJava.vb`      | Java 版本检测与切换     |
| Mod 管理  | `ModMod.vb`       | Mod 安装、禁用、排序     |
| 整合包     | `ModModpack.vb`   | 整合包解析与加载         |
| 网络请求    | `ModNet.vb`       | HTTP 请求封装        |
| 动画系统    | `ModAnimation.vb` | WPF 动画辅助函数       |
| 崩溃处理    | `ModCrash.vb`     | 崩溃报告生成           |

### UI 页面

- **PageDownload**: 下载游戏、Mod、资源包、Shader
- **PageInstance**: 游戏实例管理
- **PageLaunch**: 登录与游戏启动
- **PageSetup**: 启动器设置
- **PageOther**: 帮助、关于等页面

***

## 开发环境配置

### 系统要求

- Windows 10/11
- Visual Studio 2019 或更高版本 (支持 VB.NET)
- .NET Framework 4.6.2 SDK
- Git

### 克隆与构建

```bash
# 1. Fork 并克隆仓库
git clone https://github.com/你的用户名/PCL_NeoForged.git

# 2. 使用 Visual Studio 打开解决方案
双击 "Plain Craft Launcher 2.sln"

# 3. 选择配置 (Debug/Release)
# Debug: 调试模式，输出详细日志
# Release: 发布模式，优化编译

# 4. 按 Ctrl+Shift+B 或 点击"生成解决方案"
```

### 项目配置说明

| 配置            | 用途   | 编译常量                |
| ------------- | ---- | ------------------- |
| Debug         | 开发调试 | 无特殊常量               |
| Release       | 正式发布 | `RELEASE`           |
| Snapshot      | 快照版  | `SNAPSHOT`          |
| BETA          | 正式版  | `BETA`              |
| ReleaseUpdate | 更新发布 | `RELEASE,BY_UPDATE` |

### 第三方依赖

主要依赖库位于 `Resources/` 目录：

| 库名                    | 用途            |
| --------------------- | ------------- |
| Newtonsoft.Json.dll   | JSON 序列化/反序列化 |
| NAudio.dll            | 音频播放          |
| Ookii.Dialogs.Wpf.dll | 系统对话框         |
| Imazen.WebP.dll       | WebP 图片格式支持   |
| CacheCow.\*.dll       | HTTP 缓存       |

***

## Git 工作流程

### Fork 后的操作

```bash
# 1. 添加上游仓库
git remote add upstream https://github.com/Meloong-Git/PCL.git

# 2. 创建功能分支
git checkout -b feature/你的功能名

# 3. 进行开发并提交
git add .
git commit -m "描述你的修改"

# 4. 定期同步上游更新
git fetch upstream
git merge upstream/main

# 5. 推送分支到你的 Fork
git push origin feature/你的功能名

# 6. 在 GitHub 上创建 Pull Request
```

### 提交规范

- 使用中文描述提交内容
- 提交前确保代码可以正常编译
- 重大修改请在提交信息中说明

***

## CI/CD 构建流程

项目使用 GitHub Actions 自动构建：

1. **触发条件**: push/PR 到 `Plain Craft Launcher 2/` 目录
2. **构建矩阵**: Debug + Release
3. **构建步骤**:
   - 检出代码
   - 安装 MSBuild
   - 下载最新帮助文档
   - 替换密钥与 Commit Hash 占位符
   - 执行 MSBuild 编译
4. **产物**: 编译后的 `.exe` 文件

### Secrets 配置 (维护者)

| 密钥名                  | 用途                     |
| -------------------- | ---------------------- |
| `CLIENT_ID`          | Microsoft OAuth 客户端 ID |
| `CURSEFORGE_API_KEY` | CurseForge API 密钥      |

***

## 常见问题

### 编译报错 "找不到 xxx.dll"

确保 `Resources/` 目录下的所有 DLL 文件都存在，且项目引用路径正确。

### 运行时提示 "缺少 Microsoft .NET Framework 4.6.2"

下载并安装 [.NET Framework 4.6.2 Developer Pack](https://dotnet.microsoft.com/download/dotnet-framework/net462)。

### 如何调试启动器

1. 在 Visual Studio 中设置断点
2. 按 F5 进入调试模式
3. 程序会在断点处暂停

### 帮助文档更新

帮助文档从 [PCL2Help](https://github.com/LTCatt/PCL2Help) 仓库自动获取，构建时会自动更新。

***

## 相关链接

- 原仓库: [PCL2](https://github.com/Meloong-Git/PCL/)
- 原作者: [龙腾猫跃](https://github.com/Meloong-Git/)
- Neo Forged B站: [BiliBili](https://space.bilibili.com/1749090711)
- 爱发电: [爱发电](https://ifdian.net/a/dideng)

***

*祝你开发愉快！*
