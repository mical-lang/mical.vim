if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal commentstring=#\ %s
setlocal comments=:#
setlocal tabstop=2 shiftwidth=2 softtabstop=2

let b:undo_ftplugin = 'setlocal commentstring< comments< tabstop< shiftwidth< softtabstop<'

let &cpo = s:cpo_save
unlet s:cpo_save
