"""""""""""""""""""""""""""""""""""""""""""""""""
" Searching with silver searcher aka 'ag'
" https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  set grepformat^=%f:%l:%c:%m   " file:line:column:message
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically quit vim if quickfix window is the last
" https://vim.fandom.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  " if &buftype=="quickfix" || &buftype=="locationlist"
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

