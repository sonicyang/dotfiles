" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" TextObj Sentence {
    augroup textobj_sentence
      autocmd!
      autocmd FileType markdown call textobj#sentence#init()
      autocmd FileType textile call textobj#sentence#init()
      autocmd FileType text call textobj#sentence#init()
      autocmd FileType tex call textobj#sentence#init()
    augroup END
" }

" TextObj Quote {
    augroup textobj_quote
        autocmd!
        autocmd FileType markdown call textobj#quote#init()
        autocmd FileType textile call textobj#quote#init()
        autocmd FileType text call textobj#quote#init()
        autocmd FileType tex call textobj#quote#init()
    augroup END
" }
