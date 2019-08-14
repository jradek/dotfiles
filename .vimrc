set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Bundle 'udalov/kotlin-vim'

syntax on

filetype plugin indent on

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

set laststatus=2

set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

set list listchars=tab:»·,trail:·,nbsp:·,eol:¬

"colorscheme delek
colorscheme dracula

"set background=dark
"colorscheme solarized

"set textwidth=100   " Make it obvious where 100 characters is
"set colorcolumn=+1

set number          " show line numbers
set relativenumber
set numberwidth=4

set smartcase       " case handling for search terms
set smartindent     " smart indention when starting new line
set showmatch       " Show matching brackets.

set incsearch
set nohlsearch
set ruler           " show cursor at bottom
set cursorline      " highlight current line

set foldmethod=syntax
set foldlevelstart=20

set linebreak       " display setting: break long lines, but do not insert EOL

set showcmd

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,*.so,*.a

set backspace=indent,eol,start  " allow backspacing over everything in insert mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYMAPPING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map : to ; because it is far easier to type and ; isn;t used anyway (only
" for backward search in current line)
noremap ; :
nnoremap : ;

"This unsets the "last search pattern" register by hitting return
"" see:https://stackoverflow.com/a/662914
nnoremap <C-L> :noh<CR><C-L>
