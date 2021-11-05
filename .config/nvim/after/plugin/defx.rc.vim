if !exists('g:loaded_defx') | finish | endif

nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -split=vertical -winwidth=40 -direction=topleft
      \ -columns=mark:indent:icons:space:filename
      \ `getcwd()` -search-recursive=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
  " Define mappings
  "  进入上一层目录
    nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
  "  进入上一层目录
    nnoremap <silent><buffer><expr> <BS>
	  \ defx#do_action('cd', ['..'])
    " 进入下一层目录
	   nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
     " 进入下一层目录
    " nnoremap <silent><buffer><expr> <CR>
	  " \ defx#do_action('open')
    nnoremap <silent><buffer><expr> <CR>
    \  defx#do_action('drop')
    " 进入主目录
    nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')

    " 文件编辑操作
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')


    " 复制选中文件的目录
     nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')



     " 打开操作
    nnoremap <silent><buffer><expr> <C-t>
	  \ defx#do_action('drop','tabe')
    nnoremap <silent><buffer><expr> <C-v>
	  \ defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> <C-x>
	  \ defx#do_action('drop', 'split')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')

    " 文件创建操作
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')


      " 多选一个文件
	  nnoremap <silent><buffer><expr> t
	  \ defx#do_action('toggle_select') . 'j'
    " 多选多个文件
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')


    " 开关 显示隐藏文件
	 	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')

    " 退出
    nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')


    " 重复上个操作
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')

    " 改变 vim 当前面目录
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')

	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')

	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')

	endfunction

" call defx#custom#column('icon', {
"       \ 'directory_icon': '▸',
"       \ 'opened_icon': '▾',
"       \ 'root_icon': ' ',
"       \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

nnoremap <buffer><silent> [c <Plug>(defx-git-prev)
nnoremap <buffer><silent> ]c <Plug>(defx-git-next)
nnoremap <buffer><silent> ]a <Plug>(defx-git-stage)
nnoremap <buffer><silent> ]r <Plug>(defx-git-reset)
nnoremap <buffer><silent> ]d <Plug>(defx-git-discard)
