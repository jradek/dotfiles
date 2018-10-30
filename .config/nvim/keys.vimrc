" disable arrow keys
noremap <Up> <Nop> " :echo "use k"
noremap <Down> <Nop> " :echoe "use j"
noremap <Left> <Nop> " :echoe "use h"
noremap <Right> <Nop> " :echoe "use l"

"This unsets the "last search pattern" register by hitting return
" see: https://stackoverflow.com/a/662914
nnoremap <C-L> :noh<CR><C-L>

" map : to ; because it is far easier to type and ; isn;t used anyway (only for backward search in current line)
nnoremap ; :
nnoremap : ;

" simple save
nnoremap <leader>w :w<CR>

" alternate esc
inoremap jk <esc>

" move one left in insert mode, usefull in autocompletion with brackets
inoremap jj <right>

" move to next buffer
" nmap <leader>l :bnext<CR>

" move to next buffer
" nmap <leader>h :bprevious<CR>
