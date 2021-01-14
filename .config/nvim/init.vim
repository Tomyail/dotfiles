set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

function! Config_setEnv() abort
    if exists('g:python3_host_prog')
        return
    endif
    let g:python3_host_prog = substitute(system('which python3'), '\n', '', '')
endfunction



" https://neovim.io/doc/user/provider.html#provider-python
" python3 -m pip install --user --upgrade pynvim
call Config_setEnv()
let g:loaded_python_provider = 0
