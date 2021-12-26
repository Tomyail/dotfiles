
if exists('g:vscode')
	finish

endif
" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

" 3 is remote change, means yours(u)
nmap <leader>gu :diffget //2<CR>
" 2 is local change, means mine(m)
nmap <leader>gm :diffget //3<CR>
nmap <leader>gst :G<CR>
