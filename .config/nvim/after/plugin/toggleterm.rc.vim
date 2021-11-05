if exists('g:vscode')
	finish
endif

" Please ensure you have set hidden in your neovim config, otherwise the terminals will be discarded when closed.
set hidden
lua <<EOF
require("toggleterm").setup{
  open_mapping = [[<leader>tt]]
}
EOF

nnoremap <silent> <leader>to <cmd>ToggleTermOpenAll<cr>
nnoremap <silent> <leader>tc <cmd>ToggleTermCloseAll<cr>

