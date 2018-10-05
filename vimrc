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
set shiftwidth=2        " less indenting
set tabstop=2           " wow
set scrolloff=5         " the floor is lava!
set smarttab            " smart tabs and backspaces
set cindent             " wicked smart!
set showmatch           " match my brackets plox
set autoread            " keep on the lookout for changing files
set t_Co=256            " more colors!
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set backspace=indent,eol,start
set fillchars+=vert:\   " make the splitter prettier
set number              " add line numbers
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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Prettier settings
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'all'
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'

" CtrlP settings

let g:ctrlp_cmd = 'CtrlP'  
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg)$'

" NERDTree settings
:set mouse=a
let g:NERDTreeMouseMode=3 
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.DS_Store$', '*.swp']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Allow local overrides
if !empty(glob('~/.local_vimrc'))
  :so ~/.local_vimrc
endif
