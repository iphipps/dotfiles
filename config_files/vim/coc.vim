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

" let g:coc_auto_open = 0 " do not open quickfix

" Auto Completion
"
"
" Use tab for trigger completion with characters ahead and navigate
" " NOTE: There's always complete item selected by default, you may want to
" enable
" " no select by `"suggest.noselect": true` in your configuration file
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
   
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>


function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Formatting

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

autocmd FileType javascript,html,css,scss,typescriptreact,typescript,javascriptreact,json,markdown,* nmap <Leader>p :<C-u>Prettier<cr>

autocmd FileType dart nmap <Leader>p :<C-u>DartFmt<cr>

command! -nargs=0 Linter :CocCommand eslint.executeAutofix
autocmd FileType javascript,html,css,scss,typescriptreact,typescript,javascriptreact nmap <Leader>o :<C-u>Linter<cr>




" Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Rename
nmap <leader>rn <Plug>(coc-rename)

" navigation
nnoremap <silent> <leader>b :<C-u>CocList buffers<cr>
nnoremap <silent> <leader>h :<C-u>CocList cmdhistory<cr>
nnoremap <silent> <C-p> :<C-u>CocList files<cr>

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

" Show quickfix list"
nnoremap <silent> <leader>q :<C-u>cm

" Go next/prev on quicfix list"
nnoremap <silent> <leader>m :cn
nnoremap <silent> <leader>n :cp

" Run tsserver 
command! -nargs=0 Tsc :call CocAction('runCommand', 'tsserver.watchBuild')

" Organize Imports
command! -nargs=0 OR :call CocAction('runCommand', 'tsserver.organizeImports')


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
  \             [ 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'filename': 'LightlineFilename'
  \ },
  \ }

function! LightlineFilename()
  return expand('%')
endfunction


