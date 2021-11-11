" ------------------------------------------------------------------------------
" Re-map semi-colon to colon
nnoremap ; :
nnoremap : ;
inoremap ; :
inoremap : ;
" vnoremap X "_d

" Move selected text up/ down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Select all
nmap <C-a> gg<S-v>G

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Delete without yank
nnoremap <leader>d "_d
" nnoremap x "_x

" Delete a word backwards
nnoremap dw vb"_d

" Alternate way to ESC
nnoremap <C-c> <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Alternate way to save, quit, and escape
nnoremap <C-s> :w<CR>
nnoremap <C-Q> :wq!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" Save with root permission
command! W w !sudo tee > /dev/null %

" ------------------------------------------------------------------------------
" Windows
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +20<CR>
nnoremap <Leader>- :vertical resize -20<CR>

" Tabs
nmap te :tabedit
noremap <leader>[ gt
noremap <leader>] gT
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
