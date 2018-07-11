" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.local/share/nvim/plugged')

" color schemes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
" Plug 'chriskempson/base16-vim'

Plug 'Yggdroot/indentLine'  " indention lines
Plug 'vim-airline/vim-airline'
Plug 'udalov/kotlin-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-markdown', {'for': 'markdown'}   " markdown synatx highlight

Plug 'lifepillar/vim-solarized8'

Plug 'easymotion/vim-easymotion'

" Initialize plugin system
call plug#end()
