local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- set exrc
-- set guicursor=
-- set relativenumber
-- set nohlsearch
-- set hidden
-- set noerrorbells
-- set softtabstop=2
-- set shiftwidth=2

-- set nowrap
-- set noswapfile
-- set nobackup
-- set undodir=~/.vim/undodir
-- set incsearch
-- set termguicolors
-- set showmode
-- set completeopt=menuone,noinsert,noselect

-- set updatetime=50

-- set colorcolumn=80


-- set nocompatible
-- set fileencodings=utf-8,sjis,euc-jp,latin
-- set title
-- set autoindent
-- set showcmd
-- set laststatus=2
-- set backupskip=/tmp/*,/private/tmp/*

-- if has('nvim')
--   set inccommand=split
-- endif

-- " Suppress appending <PasteStart> and <PasteEnd> when pasting
-- set t_BE=

-- " set nosc noru nosm
-- " Don't redraw while executing macros (good performance config)
-- set lazyredraw

-- "set showmatch
-- " How many tenths of a second to blink when matching brackets
-- "set mat=2
-- " Ignore case when searching
-- " set ignorecase
-- " filetype plugin indent on
-- set backspace=start,eol,indent
-- " Finding files - Search down into subfolders
-- set path+=**


-- " Ignore files
-- set wildignore+=*/node_modules/*
-- set wildignore+=*.pyc
-- set wildignore+=*_build/*
-- set wildignore+=**/coverage/*
-- set wildignore+=**/android/*
-- set wildignore+=**/ios/*
-- set wildignore+=**/.git/*

-- " Turn off paste mode when leaving insert
-- " autocmd InsertLeave * set nopaste

-- " Add asterisks in block comments
-- set formatoptions+=r


