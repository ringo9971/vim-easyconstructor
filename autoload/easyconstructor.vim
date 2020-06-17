scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim


function! easyconstructor#easyconstructor(line1, line2) abort
  let s:list = []
  for i in range(a:line1, a:line2)
    let v = split(getline(i), ' ')
    for j in range(len(v)-1)
      call add(s:list, [v[0], v[j+1][:-2]])
    endfor
  endfor

  let s:str1 = '('
  let s:str2 = ''
  for i in range(len(s:list))
    let s:str1 .= s:list[i][0] . ' ' . s:list[i][1]
    let s:str2 .= s:list[i][1] . '(' . s:list[i][1] . ')'

    if i == len(s:list)-1
      let s:str1 .= '): '
      let s:str2 .= ' {}'
    else
      let s:str1 .= ', '
      let s:str2 .= ', '
    endif
  endfor

  call append(a:line2, s:str1 . s:str2)
  execute a:line2+1
  normal =h
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
