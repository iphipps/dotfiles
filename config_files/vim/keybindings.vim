" Navigation
nnoremap <silent> <C-p> :<C-u>CocList files<cr>
nnoremap <silent> <leader>h :<C-u>CocList cmdhistory<cr>

" Extensions
nnoremap <silent> <leader>de  :<C-u>CocList extensions<cr>

" map space to :
noremap <space> :

" Easier switching between buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Split management
nmap <silent> <leader>s :split<CR>
nmap <silent> <leader>v :vsplit<CR>
nmap <silent> <leader>S :new<CR>
nmap <silent> <leader>V :vnew<CR>
nmap <silent> <leader>x :bd<CR>

nmap <silent> <leader>h 5<C-w><
nmap <silent> <leader>l 5<C-w>>
nmap <silent> <leader>j 5<C-w>+
nmap <silent> <leader>k 5<C-w>-

function! s:moveToPane(direction)
  let oldnr = winnr()
  execute 'wincmd ' . a:direction
  if oldnr == winnr()
    call system('select-pane ' . a:direction)
  endif
endfunction

command! MoveToLeft call s:moveToPane('h')
command! MoveToDown call s:moveToPane('j')
command! MoveToUp call s:moveToPane('k')
command! MoveToRight call s:moveToPane('l')
nnoremap <silent> <C-h> :MoveToLeft<cr>
nnoremap <silent> <C-j> :MoveToDown<cr>
nnoremap <silent> <C-k> :MoveToUp<cr>
nnoremap <silent> <C-l> :MoveToRight<cr>

" Fugitive git bindings
nnoremap <silent> <leader>gb :Git branch<cr>
nnoremap <silent> <leader>l :Git blame<cr>

" Clipboard
map <C-c> :w !xclip -sel c <CR><CR>

" Ranger
nnoremap <leader>rr :Ranger<cr>


