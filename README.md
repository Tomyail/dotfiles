# dotfiles

我的 `chezmoi` 配置现在更适合按 profile 管理，而不是只靠一个粗粒度的 scene。目标是同时覆盖两台主力 Mac、一台 Windows 上的 WSL 开发环境，以及偶尔出现的临时 Linux/macOS 开发机。

## Profile Model

当前支持的 profile：

| Profile | 目标机器 | 策略 |
|---------|----------|------|
| `mac_home` | 家里主力 Mac | 完整 GUI + 开发环境 |
| `mac_office` | 公司主力 Mac | 完整 GUI + 开发环境 |
| `wsl_dev` | Windows 机器里的 WSL | 以 CLI 开发工具为主 |
| `portable` | 临时 Debian server / mac mini | 只装基础开发工具 |

设计原则：

- `mac_home` / `mac_office` 是“主力机”，允许装完整 GUI 和重型工具。
- `wsl_dev` 是“副开发环境”，强调 shell、git、tmux、nvim、lazygit 这类 CLI 工具。
- `portable` 是“临时环境”，只保留最小但顺手的一套开发体验。
- 主机名只处理少量例外，不再承担主要分层职责。

## what's included

### Core Tools

| Tool | Description | macOS | Linux Desktop | Linux Server | Linux Server (No Brew) |
|------|-------------|-------|---------------|--------------|----------------------|
| Homebrew | 跨平台包管理器 | ✅ | ✅ | ✅ | ❌ |
| Git | 版本控制工具 | ✅ | ✅ | ✅ | ✅ |
| asdf | 多语言版本管理器 | ✅ | ✅ | ✅ | ❌ |

### Shell Environment

| Tool | Description | macOS | Linux Desktop | Linux Server | Linux Server (No Brew) |
|------|-------------|-------|---------------|--------------|----------------------|
| Zsh | 现代化Shell | ✅ | ✅ | ✅ | ❌ |
| Oh My Zsh | Zsh框架 | ✅ | ✅ | ✅ | ❌ |
| Powerlevel10k | 现代化Shell主题 | ✅ | ✅ | ✅ | ❌ |
| zsh-syntax-highlighting | 语法高亮插件 | ✅ | ✅ | ✅ | ❌ |
| zsh-autosuggestions | 自动补全插件 | ✅ | ✅ | ✅ | ❌ |

### Terminal & Editor

| Tool | Description | macOS | Linux Desktop | Linux Server | Linux Server (No Brew) |
|------|-------------|-------|---------------|--------------|----------------------|
| Tmux | 终端复用器 | ✅ | ✅ | ✅ | ✅ |
| TPM | Tmux插件管理器 | ✅ | ✅ | ✅ | ✅ |
| Oh My Tmux | Tmux配置框架 | ✅ | ✅ | ✅ | ✅ |
| Neovim | 现代化编辑器 | ✅ | ✅ | ✅ | ❌ |
| Neovim Config | 个人定制配置 | ✅ | ✅ | ❌ | ❌ |
| Alacritty | GPU加速终端 | ✅ | ❌ | ❌ | ❌ |

### Development Tools

| Tool | Description | macOS | Linux Desktop | Linux Server | Linux Server (No Brew) |
|------|-------------|-------|---------------|--------------|----------------------|
| LazyGit | Git TUI工具 | ✅ | ✅ | ✅ | ❌ |
| Vimrc | Vim基础配置 | ✅ | ✅ | ✅ | ✅ |

### UI & Themes

| Tool | Description | macOS | Linux Desktop | Linux Server | Linux Server (No Brew) |
|------|-------------|-------|---------------|--------------|----------------------|
| Dracula Theme | 深色主题 | ✅ | ✅ | ❌ | ❌ |
| IBMPlexMono Nerd Font | 编程字体 | ✅ | ✅ | ❌ | ❌ |

### macOS Specific

| Tool | Description | macOS | Linux Desktop | Linux Server | Linux Server (No Brew) |
|------|-------------|-------|---------------|--------------|----------------------|
| Yabai | 窗口管理器 | ✅ | ❌ | ❌ | ❌ |
| skhd | 快捷键守护程序 | ✅ | ❌ | ❌ | ❌ |
| Rime | 输入法 | ✅ | ❌ | ❌ | ❌ |

### 快捷键说明

#### Tmux 插件管理
- 安装插件: `<prefix>` + I
- 卸载插件: `<prefix>` + Alt + u
- 更新插件: `<prefix>` + u
- vim-tmux-navigator: 窗口导航

## Project Structure

```
.
├── .chezmoi.toml.tmpl           # Chezmoi配置模板
├── .chezmoidata/profiles.yaml   # Profile定义
├── .chezmoiexternal.toml.tmpl   # 外部依赖配置模板
├── .chezmoiignore              # 忽略文件配置
├── .chezmoitemplates           # 模板目录
├── dot_Brewfile.tmpl           # Homebrew包管理配置
├── dot_aliases.tmpl            # Shell别名配置
├── dot_config                  # 配置文件目录
├── dot_dir_colors             # 目录颜色配置
├── dot_evals.tmpl             # Shell评估配置
├── dot_functions.tmpl         # Shell函数配置
├── dot_gitconfig.tmpl         # Git配置模板
├── dot_gitconfig_personal.tmpl # 个人Git配置模板
├── dot_kube                   # Kubernetes配置目录
├── dot_p10k.zsh.tmpl         # Powerlevel10k主题配置
├── dot_pkg.tmpl              # 包管理配置
├── dot_prettierrc            # Prettier格式化配置
├── dot_skhdrc.tmpl          # skhd快捷键配置
├── dot_tmux.conf.local.tmpl # Tmux本地配置
├── dot_unison               # Unison同步配置
├── dot_zprofile.tmpl       # Zsh配置文件
├── dot_zshrc.tmpl          # Zsh主配置文件
├── executable_dot_yabairc.tmpl # Yabai窗口管理配置
├── private_dot_ssh      # SSH配置（私密）
└── run_onchange_before_install_pkg.sh.tmpl # Linux包安装脚本

```

### Key Components

- **环境配置**
  - `.chezmoidata/profiles.yaml`: 定义 `mac_home` / `mac_office` / `wsl_dev` / `portable`
  - `.chezmoi.toml.tmpl`: 选择当前 profile，并写入模板数据

- **Shell配置**
  - `dot_zshrc.tmpl`: Zsh主配置文件
  - `dot_aliases.tmpl`: 常用别名定义
  - `dot_functions.tmpl`: 自定义Shell函数
  - `dot_evals.tmpl`: Shell环境变量和评估配置

- **开发工具配置**
  - `dot_gitconfig.tmpl`: Git全局配置
  - `dot_gitconfig_personal.tmpl`: Git个人配置
  - `dot_prettierrc`: 代码格式化配置
  - `dot_kube/`: Kubernetes配置

- **终端美化**
  - `dot_p10k.zsh.tmpl`: Powerlevel10k主题配置
  - `dot_dir_colors`: 目录颜色配置
  - `dot_tmux.conf.local.tmpl`: Tmux终端复用器配置

- **窗口管理**
  - `executable_dot_yabairc.tmpl`: Yabai窗口管理器配置
  - `dot_skhdrc.tmpl`: skhd快捷键配置

- **包管理**
  - `dot_Brewfile.tmpl`: Homebrew包管理配置
  - `dot_pkg.tmpl`: 通用包管理配置
  - `run_onchange_before_install_pkg.sh.tmpl`: Linux包安装入口

## How to install

[using bitwarden cli to get the password](https://medium.com/@josemrivera/share-credentials-across-machines-using-chezmoi-and-bitwarden-4069dcb6e367)

```sh
xcode-select --install

# mac_home | mac_office | wsl_dev | portable
export CHEZMOI_PROFILE=mac_home
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tomyail
```

chezmoi dir: `~/.config/chezmoi/chezmoi.toml`
zsh should be the default shell:

```bash
chsh -s $(which zsh)
```

## Chezmoi 日常维护

### 基本工作流程

```bash
# 查看当前配置与实际文件的差异
chezmoi diff

# 编辑配置文件
chezmoi edit ~/.zshrc

# 添加新的配置文件到管理
chezmoi add ~/.config/nvim/init.lua

# 应用所有更改
chezmoi apply

# 进入源码目录进行git操作
chezmoi cd
git add .
git commit -m "Update neovim config"
git push
```

### 常用维护命令

#### 日常操作
```bash
# 更新配置（从远程仓库拉取并应用）
chezmoi update -v

# 查看未管理的文件
chezmoi unmanaged

# 查看特定目录的未管理文件
chezmoi unmanaged ~/.config ~/.ssh

# 检查配置状态
chezmoi doctor

# 查看所有管理的文件
chezmoi managed
```

#### 编辑和管理
```bash
# 编辑特定配置文件
chezmoi edit ~/.gitconfig
chezmoi edit dot_aliases.tmpl

# 重新生成配置文件（当模板修改时）
chezmoi init

# 验证模板语法
chezmoi execute-template '{{ .chezmoi.os }}/{{ .chezmoi.arch }}'

# 从外部源导入文件
chezmoi import --destination ~/.config/alacritty/alacritty.yml alacritty.yml
```

### Profile 管理

```bash
# 切换环境配置
export CHEZMOI_PROFILE=mac_office
chezmoi apply

# 查看当前 profile
chezmoi execute-template '{{ .profile }}'

# 兼容旧环境变量
export CHEZMOI_SCENE=mac_office
chezmoi apply
```

## 推荐的分层方式

继续整理模板时，建议按这四层来写：

1. 通用层
   不看 hostname，只判断命令是否存在。
   例如：`git`、`tmux`、`nvim`、`direnv`、`atuin`、shell aliases。

2. 平台层
   只处理 `darwin` / `linux` / `windows` 差异。
   例如：Homebrew shellenv、Rime、OrbStack、macOS GUI。

3. profile 层
   用 `mac_home` / `mac_office` / `wsl_dev` / `portable` 控制“装多重”和“装哪些”。

4. 主机例外层
   只处理极少量的公司专属或家庭专属差异。

如果一个逻辑只是“主力机都要，临时机不要”，那就应该写成 profile 判断，而不是 hostname 判断。

### 模板和数据管理

```bash
# 查看所有模板变量
chezmoi dump --format=json

# 测试模板渲染
chezmoi execute-template --init --promptString "email=user@example.com" < .chezmoi.toml.tmpl

# 查看状态数据
chezmoi state data

# 设置状态数据
chezmoi state set --bucket=entry --key=editor --value=nvim
```

### 故障排除

```bash
# 详细模式运行以查看详细信息
chezmoi -v apply

# 检查特定文件的问题
chezmoi diff ~/.zshrc

# 查看配置文件位置
chezmoi config

# 重新初始化（谨慎使用）
chezmoi init --force
```

### 定期维护建议

#### 每周维护
```bash
# 1. 更新配置
chezmoi update

# 2. 检查并清理未使用的文件
chezmoi unmanaged | grep -i backup

# 3. 备份重要配置
chezmoi archive > dotfiles-backup-$(date +%Y%m%d).tar.gz
```

#### 每月维护
```bash
# 1. 全面检查配置差异
chezmoi diff

# 2. 更新所有包管理器
brew update && brew upgrade
asdf plugin-update --all

# 3. 清理不需要的包
brew cleanup
```

### 最佳实践

1. **提交前检查**: 每次提交前运行 `chezmoi diff` 确认更改
2. **频繁提交**: 小而频繁的提交比大的提交更容易管理
3. **使用模板**: 利用模板系统处理环境差异
4. **定期备份**: 使用 `chezmoi archive` 定期备份配置
5. **文档更新**: 修改配置时同步更新README文档

### 配置同步到新机器

```bash
# 方法1: 快速设置（推荐）
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --purge tomyail

# 方法2: 分步设置
curl -sfL https://chezmoi.io/install.sh | sh
chezmoi init tomyail
chezmoi diff
chezmoi apply
```

### 有用的别名

可以添加到 `dot_aliases.tmpl`:

```bash
# Chezmoi快捷命令
alias cz='chezmoi'
alias czd='chezmoi diff'
alias cza='chezmoi apply'
alias cze='chezmoi edit'
alias czu='chezmoi update'
alias czc='chezmoi cd'
alias czs='chezmoi status'
```

## Inspiration

- https://safjan.com/top-popular-zsh-plugins-on-github-2023/
