if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
au BufNewFile,BufRead *.css set syntax=css
au BuFNewFile,BufRead *.scss set syntax=css
au BufNewFile,BufRead *.html set syntax=html
au BufNewFile,BufRead *.scss set syntax=scss
au BufNewFile,BufRead *.js set syntax=javascript
filetype plugin indent on

set expandtab           " 4 tabs per space
set shiftwidth=4        " less indenting
set tabstop=4           " wow
set scrolloff=5         " the floor is lava!
set smarttab            " smart tabs and backspaces
set cindent             " wicked smart!
set showmatch           " match my brackets plox
set autoread            " keep on the lookout for changing files
set t_Co=256            " more colors!
set backspace=indent,eol,start
nore ; :

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Prettier settings
" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'