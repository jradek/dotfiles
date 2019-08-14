"""""""""""""""""""""""""""""""""""""""""""""""""
" Faster Grepping in Vim
" https://thoughtbot.com/blog/faster-grepping-in-vim

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" This defines a new command Ag to search for the provided text and open a “quickfix” window:
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically quit vim if quickfix window is the last
" https://vim.fandom.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

