if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:key = '\%(\S\+\|"[^"]*"\|''[^'']*''\)'

" Key: first token on a line, triggers value matching via nextgroup
" Defined first so comments/directives/shebang (defined later) override it
execute 'syn match micalKey /^\s*\zs' . s:key . '/'
  \ 'nextgroup=@micalValue skipwhite'

" Shebang
syn match micalShebang /\%^#!.*/

" Comments: # followed by space (or alone) at start of line
syn match micalComment /^\s*#\%(\s.*\)\?$/

" Directives: # immediately followed by a word character
syn match micalDirective /^#\w.*/

" Prefix block close brace
syn match micalBraceClose /^\s*}\s*$/

" Value types cluster
syn cluster micalValue contains=micalLineString,micalString,
  \ micalBoolean,micalNumber,micalBlockStringHeader,micalBraceOpen

" Line string (fallback, defined first = lowest priority)
syn match micalLineString /\s*\zs.\+/ contained

" Quoted strings
syn region micalString matchgroup=micalStringDelimiter
  \ start=/\s*\zs"/ skip=/\\./ end=/"/ oneline contained contains=micalEscape
syn region micalString matchgroup=micalStringDelimiter
  \ start=/\s*\zs'/ skip=/\\./ end=/'/ oneline contained contains=micalEscape
syn match micalEscape /\\[\\'"nrt]/ contained

" Boolean values: only when the entire value is true/false
syn match micalBoolean /\s*\zs\%(true\|false\)\ze\s*$/ contained

" Integer values: only when the entire value is a number literal
syn match micalNumber /\s*\zs[+-]\?\%(0[xX][0-9A-Fa-f][0-9A-Fa-f_]*\|0[bB][01][01_]*\|0[oO][0-7][0-7_]*\|[0-9][0-9_]*\)\ze\s*$/ contained

" Block string header triggers body region on next line
syn match micalBlockStringHeader /\s*\zs[|>][+-]\?\ze\s*$/ contained
  \ nextgroup=micalBlockString skipempty
syn region micalBlockString start=/^\z(\s\+\)/ skip=/^\s*$/ end=/^\%(\z1\)\@!/
  \ contained

" Prefix block open brace
syn match micalBraceOpen /\s*\zs{\ze\s*$/ contained

hi def link micalKey Identifier
hi def link micalShebang PreProc
hi def link micalComment Comment
hi def link micalDirective PreProc
hi def link micalLineString String
hi def link micalString String
hi def link micalStringDelimiter String
hi def link micalEscape SpecialChar
hi def link micalBoolean Boolean
hi def link micalNumber Number
hi def link micalBlockString String
hi def link micalBlockStringHeader Special
hi def link micalBraceOpen Structure
hi def link micalBraceClose Structure

let &cpo = s:cpo_save
unlet s:cpo_save

let b:current_syntax = 'mical'
