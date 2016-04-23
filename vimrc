syntax on
au BufNewFile,BufRead *.cmp set syntax=mason
au BufNewFile,BufRead *.mas set syntax=mason
au BufNewFile,BufRead *.xmp set syntax=mason
au BufNewFile,BufRead *.css set syntax=css
au BuFNewFile,BufRead *.scss set syntax=css
set expandtab           " 4 tabs per space
set shiftwidth=4        " less indenting
set tabstop=4           " wow
set scrolloff=5         " the floor is lava!
set smarttab            " smart tabs and backspaces
set cindent             " wicked smart!
set showmatch           " match my brackets plox
set autoread            " keep on the lookout for changing files
set t_Co=256            " more colors!
nore ; :


autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red
