if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
	Plug 'asvetliakov/vim-easymotion'
	Plug 'editorconfig/editorconfig-vim'

call plug#end()

