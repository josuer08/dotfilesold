set nocompatible "its just because if i share it it might be useful
set number
set relativenumber 
"FOR FINDING FILES:
"a better way to find everything that is in my actual subfolder or bellow
set path+=**
set wildmenu 
"una nota importante es que podemos simplemente usar ":b nombre" para
"cambiar entre los buffers que tenemos abiertos, los que podemos ver 
"con el comando ":ls" que nos deja ver todos los buffer


"PARA CREAR TAGS EN UN PROYECTO:
command! MakeTags !ctags -R .
" ahora al hacer ":MakeTags" podremos hacer un tags file
" esto nos permite hacer lo siguiente:

" COMANDOS PARA TAGS:
" usar "^]" para saltar a la definicion
" usar "g^]" para tags ambiguos
" usar "^t" para devolverse en el stack
" tambien para autocompletar tenemos
" "^x^n" para algo en el archivo actual
" "^x^f" para filenames
" "^x^]" para tags
" "^n" para cosas que estan en el 'complete'


"FILE BROWSING:
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_dide=',\(^\|\s\s\)\zs\.\S\+'
