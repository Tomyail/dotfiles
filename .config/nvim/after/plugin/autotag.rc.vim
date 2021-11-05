
if exists('g:vscode')
	finish
endif

lua <<EOF
require('nvim-ts-autotag').setup()
EOF
