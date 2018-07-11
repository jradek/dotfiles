" disable arrow keys
noremap <Up> :echoe "use k"
noremap <Down> :echoe "use j"
noremap <Left> :echoe "use h"
noremap <Right> :echoe "use l"

"This unsets the "last search pattern" register by hitting return
" see: https://stackoverflow.com/a/662914
nnoremap <C-L> :noh<CR><C-L>

" map : to ; because it is far easier to type and ; isn;t used anyway
nnoremap ; :
nnoremap : ;

" simple save
nnoremap <leader>w :w<CR>

" alternate esc
inoremap jk <esc>


" move to next buffer
" nmap <leader>l :bnext<CR>

" move to next buffer
" nmap <leader>h :bprevious<CR>
