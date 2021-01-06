set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" https://neovim.io/doc/user/provider.html#provider-python
" python3 -m pip install --user --upgrade pynvim
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
