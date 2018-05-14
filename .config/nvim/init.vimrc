" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.local/share/nvim/plugged')

" color schemes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

Plug 'Yggdroot/indentLine'  " indenion lines
Plug 'vim-airline/vim-airline'
Plug 'udalov/kotlin-vim'
Plug 'bronson/vim-trailing-whitespace'

" Initialize plugin system
call plug#end()
