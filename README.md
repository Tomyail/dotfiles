# 我的系统配置项(dotfiles)

基于 [yadm](https://yadm.io/) 管理的系统配置仓库,用来同步自己的 mac,树莓派 和 wsl 上面基本配置

## 安装和配置 (先确保你看过我的各种配置,不然把你自己的各种配置覆盖了后果自负...)

1. 安装 [yadm](https://yadm.io/docs/install)
2. 克隆项目到本地: yadm clone https://github.com/Tomyail/dotfiles.git


后续脚本更新只要 yadm pull 就好了, yadm bootstrap 可以重新触发安装流程


## 主要配置

* vim
* zsh + oh-my-zsh
* git 
* tmux


### vim

来自 https://github.com/Tomyail/vimrc/tree/9542ec5f5e2a29df9c849a702a7e537e4d5a0330

### tmux

包含插件:

* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm): tmux 插件管理
* [Tmux Resurrect](https://github.com/tmux-plugins/tmux-resurrect#key-bindings): tmux session 保存

第一次使用 tmux 需要 
```
# 更新配置
tmux source ~/.tmux.conf
# 安装插件
prefix+ I
```
