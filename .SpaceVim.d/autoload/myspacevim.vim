function! myspacevim#before() abort
		" 配置默认的 leader key
    " let g:mapleader = ','
		" 修改 coc-settings.json 的路径，使其不放在 SpaceVim 而是 SpaceVim.d 文件夹下
		let g:coc_config_home = '~/.SpaceVim.d/'


		call SpaceVim#custom#SPC('nore',['n','f'], ':NERDTreeFind','NERDTreeFind',1)

		call SpaceVim#custom#SPC('nore',['f','v','e'], ':e! ~/.SpaceVim.d/autoload/myspacevim.vim','edit myspacevim',1)

	endfunction


	function! myspacevim#after() abort

		" seems no work
		autocmd BufWritePost  ~/.SpaceVim.d/autoload/myspacevim.vim source ~/.SpaceVim.d/autoload/myspacevim.vim

		call SpaceVim#custom#LangSPCGroupName('typescriptreact',['X'],"+XX")
		call SpaceVim#custom#LangSPC('typescriptreact','nore',['X','x'],'echom 1', 'echmessage 1',2)

		" GoTo code navigation.
		nmap <silent> gd <Plug>(coc-definition)
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> gi <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)

		" Remap keys for applying codeAction to the current buffer.
		nmap <leader>ac  <Plug>(coc-codeaction)
		" Apply AutoFix to problem on the current line.
		nmap <leader>qf  <Plug>(coc-fix-current)

		" Map function and class text objects
		" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
		xmap if <Plug>(coc-funcobj-i)
		omap if <Plug>(coc-funcobj-i)
		xmap af <Plug>(coc-funcobj-a)
		omap af <Plug>(coc-funcobj-a)
		xmap ic <Plug>(coc-classobj-i)
		omap ic <Plug>(coc-classobj-i)
		xmap ac <Plug>(coc-classobj-a)
		omap ac <Plug>(coc-classobj-a)

	endfunction
