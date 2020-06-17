scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_easyconstructor')
  finish
endif
let g:loaded_easyconstructor = 1

command! -range EasyConstrutor call easyconstructor#easyconstructor(<line1>, <line2>)

let &cpo = s:save_cpo
unlet s:save_cpo
