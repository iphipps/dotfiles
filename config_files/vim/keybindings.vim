" Navigation
nnoremap <silent> <C-p> :<C-u>CocList files<cr>
nnoremap <silent> <leader>h :<C-u>CocList cmdhistory<cr>

" Extensions
nnoremap <silent> <leader>de  :<C-u>CocList extensions<cr>

" map space to :
noremap <space> :

" Easier switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier switching between buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>


" Easier resizing 
map <A-Left> <c-w><
map <A-Right> <c-w>>
map <A-Up> <c-w>+
map <A-Down> <c-w>-

" Ranger
nnoremap <leader>rr :Ranger<cr>


