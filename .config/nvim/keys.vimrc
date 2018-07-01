" disable arrow keys
noremap <Up> :echoe "use k"
noremap <Down> :echoe "use j"
noremap <Left> :echoe "use h"
noremap <Right> :echoe "use l"

"This unsets the "last search pattern" register by hitting return
nnoremap <C-L> :noh<CR><C-L>

" map : to ; because it is far easier to type and ; isn't used that often (backward search in current line)
nnoremap ; :
nnoremap : ;
