syntax on
au BufNewFile,BufRead *.cmp set syntax=mason
au BufNewFile,BufRead *.mas set syntax=mason
au BufNewFile,BufRead *.xmp set syntax=mason
au BufNewFile,BufRead *.css set syntax=css
au BuFNewFile,BufRead *.scss set syntax=css
au BufNewFile,BufRead *.html set syntax=html
au BufNewFile,BufRead *.jsp set syntax=jsp
au BufNewFile,BufRead *.tag set syntax=jsp
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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" # Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" # Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" # Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" # Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'mustache/vim-mustache-handlebars'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" # Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
