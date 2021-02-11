" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" *** basic ***
set nocompatible
set guicursor=

set t_Co=256                " Set 256 Color for screen and tmux
scriptencoding utf-8

set updatetime=100

set tags=./tags;/,~/.vimtags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set spell                   " Spell checking on
set hidden                  " Allow buffer switching without saving

set shortmess+=filmnrxoOtT  " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore     " Allow for cursor beyond last character
set history=1000            " Store a ton of history (default is 20)

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

set iskeyword-=.            " '.' is an end of word designator
set iskeyword-=#            " '#' is an end of word designator
set iskeyword-=-            " '-' is an end of word designator
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

" Arrow Key Fix
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

" *** Clipboard ***
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" *** Cursors ***
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" *** Directories ***
" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile            " So is persistent undo ...
    set undolevels=1000     " Maximum number of changes that can be undone
    set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
endif

" Add exclusions to mkview and loadview
" eg: *.*, svn-commit.tmp
let g:skipview_files = [
    \ '\[example pattern\]'
    \ ]
