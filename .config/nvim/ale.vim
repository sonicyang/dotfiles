" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

" Let COC handle LSP
let g:ale_disable_lsp = 1

" Show error if any
let g:ale_open_list = 0

" These 2 some how sucks, the echo_msg is overwritten and window size revert
" on manual loclist close/open
let g:ale_echo_msg_foramt = '[%linter%] %%s'
let g:ale_list_window_size = 4

" clangcheck complains about JSON compilation database too much
let g:ale_linters_ignore = {"cpp" : ["clangcheck"]}

let g:ale_cpp_cc_executable = 'clang++'
let g:ale_cpp_cc_options = '-std=c++2a -Wextra'

let g:ale_cpp_clangtidy_checks = ['*']
let g:ale_cpp_clangtidy_extra_options = '-std=c++2a'

let g:ale_cpp_clangcheck_options = ''
let g:ale_cpp_clangcheck_extra_options = '-std=c++2a'

" Exit Vim if LocList is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && getwininfo(win_getid())[0]['loclist'] |
    \ quit | endif

function! ToggleLocList()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        lopen
    endif
endfunction
