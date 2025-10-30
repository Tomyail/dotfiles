# dotfiles

my dotfiles for macos(working), ubuntu desktop(personal project) and ubuntu server(cloud and home server).

dot files are separated by desktop and server.

desktop for daily use and server for cloud and home server.

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
├── linux_server            # Linux服务器特定配置
├── mac_home               # Mac家庭环境配置
├── mac_office            # Mac办公环境配置
├── mac_shared           # Mac共享配置
├── private_dot_ssh      # SSH配置（私密）
└── ubuntu_desktop       # Ubuntu桌面环境配置

```

### Key Components

- **环境配置**
  - `mac_home/`: Mac家庭环境特定配置
  - `mac_office/`: Mac办公环境特定配置
  - `mac_shared/`: Mac共享配置
  - `linux_server/`: Linux服务器配置
  - `ubuntu_desktop/`: Ubuntu桌面配置

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

## How to install

[using bitwarden cli to get the password](https://medium.com/@josemrivera/share-credentials-across-machines-using-chezmoi-and-bitwarden-4069dcb6e367)

```sh
xcode-select --install

# mac_home|mac_offie|linux_server|ubuntu_desktop
export CHEZMOI_SCENE=mac_home
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

### 场景管理

```bash
# 切换环境配置
export CHEZMOI_SCENE=mac_office
chezmoi apply

# 查看当前场景信息
chezmoi execute-template '{{ .chezmoi.scene }}'

# 针对特定环境应用配置
chezmoi apply --include=mac_home
chezmoi apply --exclude=linux_server
```

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
