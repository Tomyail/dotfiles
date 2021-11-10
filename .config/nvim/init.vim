if exists('g:vscode')
runtime ./plug.vs.vim
  runtime ./maps.vim
  finish
endif

set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
set incsearch
set termguicolors
set scrolloff=8
set showmode
set completeopt=menuone,noinsert,noselect

set cmdheight=2

set updatetime=50

set colorcolumn=80


set nocompatible
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set showcmd
set laststatus=2
" set shell=zsh
set backupskip=/tmp/*,/private/tmp/*
" enable mouse for resize window
set mouse=a

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

" set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
" set ignorecase
" filetype plugin indent on
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**


" Ignore files
set wildignore+=*/node_modules/*
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Turn off paste mode when leaving insert
" autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

set cursorline
set termguicolors
"set cursorcolumn

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

" autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
" autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
" autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

syntax enable
runtime ./plug.vim
runtime ./maps.vim

