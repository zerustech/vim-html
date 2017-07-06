if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

" Backup the compatibility options.
let s:save_cpo = &cpo

" Disables text-wrap for normal text.
setlocal formatoptions-=t

" Enables text-wrap for comments.
setlocal formatoptions+=croql

" Due to issue https://github.com/vim/vim/issues/1696, the middle part of three-piece comments must NOT be blank.
setlocal comments=s1:<!--[,m:\ \ \ \ ,ex:]-->,s4:<!--,m://,ex:-->

" Restore the saved compatibility options.
let &cpo = s:save_cpo
unlet s:save_cpo
