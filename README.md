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

## Inspiration

- https://safjan.com/top-popular-zsh-plugins-on-github-2023/
