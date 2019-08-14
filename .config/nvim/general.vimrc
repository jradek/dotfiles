syntax on

filetype plugin indent on
language en_US

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

set laststatus=2
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

set list listchars=tab:»·,trail:·,nbsp:·,eol:¬

""""""""""""""""""
" color scheme stuff
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set background=dark

"" GRUXBOX
" colorscheme gruvbox

if (has("termguicolors"))
 set termguicolors
endif
"" OCEANIC
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" NORD
colorscheme nord

"""""""""""""""""""
" other stuff
set number
" set relativenumber

set smartcase       " case handling for search terms
set smartindent     " smart indention when starting new line
set showmatch       " Show matching brackets.

set incsearch
set hlsearch
set ruler           " show cursor at bottom

set cursorline      " highlight current line
" highlight CursorLine ctermbg=black
" highlight Normal ctermbg=NONE

set linebreak       " display setting: break long lines, but do not insert EOL

set showcmd

set wildmenu
set wildmode=list:longest,list:full

set backspace=indent,eol,start


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encryption/decryption
"
" See also: https://www.tomasperez.com/symmetric-encryption-vim-gpg/

" Transparent editing of gpg files for symmetric encryption.
" Forked and modified from an original implementation by Wouter Hanegraaff.
" @see http://vim.wikia.com/wiki/Encryption
augroup encrypted
    au!

    " Avoid writing to ~/.viminfo while editing
    autocmd BufReadPre,FileReadPre *.gpg set viminfo=
    autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup
    autocmd BufReadPre,FileReadPre *.gpg set bin
    autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2

    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt --no-use-agent 2> /dev/null
    autocmd BufReadPost,FileReadPost *.gpg set nobin
    autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

    " Encrypt text before writing
    autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --armor --symmetric --no-use-agent --yes --cipher-algo AES256 2> /dev/null
    autocmd BufWritePost,FileWritePost *.gpg u
augroup END
