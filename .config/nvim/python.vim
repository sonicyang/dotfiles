" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

" Disable if python support not present
if !has('python') && !has('python3')
    let g:pymode = 0
endif

let g:pymode_lint = 0
let g:pymode_lint_unmodified = 1
let g:pymode_python = 'python3'
let g:pymode_lint_checkers = []
"let g:pymode_lint_checkers = ['pep8', 'mccabe', 'pyflakes', 'pylint']
let g:pymode_trim_whitespaces = 0
let g:pymode_options = 0
let g:pymode_rope = 0
