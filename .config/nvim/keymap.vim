" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

" The default leader is '\', but many people prefer ',' as it's in a standard
" location. To override this behavior and set it back to '\' (or any other
" character):
let mapleader = ','
let maplocalleader = '_'

" *** Function Keys ***
nnoremap <silent> <F1> :call quickui#menu#open()<CR>
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <silent> <F2> :NERDTreeMirror<CR>:NERDTreeToggle<CR>
nnoremap <silent> <F3> :TagbarToggle<CR>
nmap     <silent> <F4> :SrcExplToggle<CR>
nnoremap <silent> <F5> :call ToggleLocList()<CR>
nmap     <silent> <F11> <Plug>(ale_previous_wrap)
nmap     <silent> <F12> <Plug>(ale_next_wrap)

" *** Other Plugin Keys ***
" QuickUI context menu
nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<CR>
nnoremap <silent> <C-q> :call quickui#tools#list_buffer('buffer')<CR>
nnoremap <silent> <C-f> :call quickui#tools#list_function()<CR>
nnoremap <silent> <C-d> :call quickui#tools#preview_tag('')<cr>

" Undotree
nnoremap <silent> <C-u> :UndotreeToggle<CR>

" Session
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>

" Ctrl-Pfunky
nnoremap <Leader>fu :CtrlPFunky<Cr>

" Tabularize
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" *** Generic ***
cmap Tabe tabe
cmap Tabnew tabnew

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Most prefer to toggle search highlighting rather than clear the current
" search results.
nmap <silent> <leader>/ :set invhlsearch<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Easier formatting
nnoremap <silent> <leader>q gwip

" *** Easy Movement ***
" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" *** Easy Visual Mode ***
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" *** Easier moving in windows ***
" The lines conflict with the default digraph mapping of <C-K>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" *** Easier moving in tabs ***
" The following two lines conflict with moving to top and
" bottom of the screen
map <S-H> gT
map <S-L> gt

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" *** Code folding options ***
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" *** HOME/End Remapping ***

" End/Start of line motion keys act relative to row/wrap width in the
" presence of `:set wrap`, and relative to line for `:set nowrap`.
" Default vim behaviour is to act relative to text line in both cases
" Same for 0, home, end, etc
function! WrapRelativeMotion(key, ...)
    let vis_sel=""
    if a:0
        let vis_sel="gv"
    endif
    if &wrap
        execute "normal!" vis_sel . "g" . a:key
    else
        execute "normal!" vis_sel . a:key
    endif
endfunction

" Map g* keys in Normal, Operator-pending, and Visual+select
noremap $ :call WrapRelativeMotion("$")<CR>
noremap <End> :call WrapRelativeMotion("$")<CR>
noremap 0 :call WrapRelativeMotion("0")<CR>
noremap <Home> :call WrapRelativeMotion("0")<CR>
noremap ^ :call WrapRelativeMotion("^")<CR>
" Overwrite the operator pending $/<End> mappings from above
" to force inclusive motion with :execute normal!
onoremap $ v:call WrapRelativeMotion("$")<CR>
onoremap <End> v:call WrapRelativeMotion("$")<CR>
" Overwrite the Visual+select mode mappings from above
" to ensure the correct vis_sel flag is passed to function
vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>

" *** Stupid shift key fixes ***
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
