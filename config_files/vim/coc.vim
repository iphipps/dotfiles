let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-prettier',
  \ 'coc-rls',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ ]

" Auto Completion
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" Rename
nmap <leader>rn <Plug>(coc-rename)

" navigation
nnoremap <silent> <leader>b :<C-u>CocList buffers<cr>
nnoremap <silent> <leader>h :<C-u>CocList cmdhistory<cr>

" Show extension list
nnoremap <silent> <leader>de  :<C-u>CocList extensions<cr>
" Show symbols of current buffer
nnoremap <silent> <leader>do  :<C-u>CocList -A symbols<cr>
" Show diagnostics of current workspace
nnoremap <silent> <leader>da  :<C-u>CocList diagnostics<cr>
" Show available commands
nnoremap <silent> <leader>dc  :<C-u>CocList commands<cr>
" Show available services
nnoremap <silent> <leader>ds  :<C-u>CocList services<cr>
" grep word
nnoremap <silent> <leader>f :<C-u>CocList grep<cr> 


" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" Lightline stuff
function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }


