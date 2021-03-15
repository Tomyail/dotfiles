function! myspacevim#before() abort
	" 配置默认的 leader key
    let g:mapleader = ','
" 修改 coc-settings.json 的路径，使其不放在 SpaceVim 而是 SpaceVim.d 文件夹下

let g:coc_config_home = '~/.SpaceVim.d/'
	endfunction
