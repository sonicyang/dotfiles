" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 6

" Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100

" Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>"

" Set "BackSpace" key for back from the definition context 
let g:SrcExpl_gobackKey = "<BS>"

" In order to avoid conflicts, the Source Explorer should know what plugins except
" itself are using buffers. And you need add their buffer names into below list
" according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "[Location List]",
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

" The color schemes used by Source Explorer. There are five color schemes
" supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
" will pick up one of them randomly when initialization.
let g:SrcExpl_colorSchemeList = [
        \ "Green",
        \ "Red",
        \ "Cyan",
        \ "Yellow",
        \ "Magenta"
    \ ]
