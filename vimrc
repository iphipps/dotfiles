if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
au BufNewFile,BufRead *.dsld set syntax=groovy
filetype plugin indent on

set background=dark     " terminal theme is darkish hence
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
set mouse=a             " allow mouse to click on nerdtree files
set number relativenumber              " add line numbers
vmap <C-c> "+y
" allow mouse to copy to clipboard
set clipboard=unnamed   " allow mouse to copy to clipboard
set hls                 " allow highlighting when using *
noremap <space> :
" map space to :
noremap : <NOP>
" remove :
nore ; :
nnoremap <leader>. :CtrlPTag<cr>

" Move swap file from beside the source file
 set swapfile
 set dir=~/.tmp

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
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'rust-lang/rust.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" General settings
let mapleader = ","

" Prettier settings
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#autoformat = 1
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'

" CtrlP settings

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Completion settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree settings
let g:NERDTreeMouseMode=3 
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.DS_Store$', '*.swp', '.git']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close nerdtree when closing file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ale settings
let g:ale_sign_error = '⚡️' " Less aggressive than the default '>>'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_completion_enabled = 1


" Editor config settings -- requires a brew install editorconfig
let g:EditorConfig_core_mode = 'external_command'

" Ctags
set tags=./tags;

" Allow local overrides
if !empty(glob('~/.local_vimrc'))
  :so ~/.local_vimrc
endif
