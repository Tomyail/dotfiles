" Description: Keymaps
let mapleader=","
nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
" nnoremap x "_x
" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
" nnoremap dw vb"_d

" Select all
" nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Source
nnoremap rr :source $MYVIMRC<CR>
nnoremap re :e $MYVIMRC<CR>
"-----------------------------
" Tabs

map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
" nmap te :tabedit
" nmap <S-Tab> :tabprev<CR>
" nmap <Tab> :tabnext<CR>

"------------------------------
" Windows

" Split window
nmap sx :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w
" Move window
" nmap <leader>w <C-w>w
" Reize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" exit terminal insert mode
:tnoremap <Esc> <C-\><C-n>
