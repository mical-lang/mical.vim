set nocompatible
set runtimepath=$VIMRUNTIME
let s:root = expand('<sfile>:p:h:h')
execute 'set runtimepath^=' . s:root
filetype plugin on
syntax on
