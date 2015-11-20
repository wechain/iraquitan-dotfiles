set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'vim-ruby/vim-ruby'
Plugin 'maciakl/vim-neatstatus'
Plugin 'elzr/vim-json'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'chrisbra/csv.vim'
Plugin 'junegunn/vim-emoji'
Plugin 'majutsushi/tagbar'

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

"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""
" F4 display TagList
nmap <silent> <F4> :TagbarToggle<CR>

" Backspace works on previously sessions
:set backspace=2

"""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""
" Color theme setup
set number
syntax enable
set background=dark
colorscheme base16-ocean

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Emoji
set completefunc=emoji#complete

" NerdCommenter
let g:NERDSpaceDelims=1

" Nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" CtrlP
let g:ctrlp_show_hidden = 1

" <F8> sort import and auto pep8
autocmd FileType python map <buffer> <F8> :!yapf -i % --style=google;isort %;<CR><CR>

" Jedi-vim setup
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_command = "<C-Space>"

" flake8
let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd! BufRead,BufWritePost *.py call Flake8()
