# 我的系统配置项(dotfiles)

基于 [yadm](https://yadm.io/) 管理的系统配置仓库,用来同步自己的 mac,树莓派 和 wsl 上面基本配置

## 安装和配置 (先确保你看过我的各种配置,不然把你自己的各种配置覆盖了后果自负...)

1. 安装 [yadm](https://yadm.io/docs/install)
2. 克隆项目到本地: yadm clone git@github.com:Tomyail/dotfiles.git

后续脚本更新只要 yadm pull 就好了, yadm bootstrap 可以重新触发安装流程


## 主要配置

### vim

vim lsp 依赖的几个 npm 依赖包:

```bash
npm i -g prettier eslint_d diagnostic-languageserver typescript typescript-language-server vim-language-server
```

### tmux

