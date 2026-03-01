function! s:DumpSyntax()
  let l:result = []
  for l:lnum in range(1, line('$'))
    let l:line = getline(l:lnum)
    if l:line ==# ''
      call add(l:result, printf('%3d: (empty)', l:lnum))
      continue
    endif
    let l:groups = []
    let l:prev = ''
    let l:sc = 1
    for l:c in range(1, col([l:lnum, '$']) - 1)
      let l:g = synIDattr(synID(l:lnum, l:c, 1), 'name')
      if l:g !=# l:prev
        if l:prev !=# ''
          call add(l:groups, l:prev . '[' . strpart(l:line, l:sc - 1, l:c - l:sc) . ']')
        endif
        let l:prev = l:g
        let l:sc = l:c
      endif
    endfor
    if l:prev !=# ''
      call add(l:groups, l:prev . '[' . strpart(l:line, l:sc - 1) . ']')
    endif
    call add(l:result, printf('%3d: %s', l:lnum, join(l:groups, ' ')))
  endfor
  return l:result
endfunction

let s:outfile = fnamemodify(expand('<sfile>'), ':p:h') . '/syntax-dump.txt'

redraw
let s:out = s:DumpSyntax()
call writefile(s:out, s:outfile)
quitall!
