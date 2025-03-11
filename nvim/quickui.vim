" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
    finish
endif

let g:quickui_border_style = 2
let g:quickui_color_scheme = 'gruvbox'

let g:quickui_preview_w = 100
let g:quickui_preview_h = 15

" let g:quickui_show_tip = 1

call quickui#menu#reset()

call quickui#menu#install("&File", [
            \ [ "&Open\t(:tabnew)", 'call feedkeys(":tabnew ")'],
            \ [ "&Save\t(:w)", 'write'],
            \ [ "--", ],
            \ [ "Session &List\t,sl", 'SessionList'],
            \ [ "Session S&ave\t,ss", 'SessionSave'],
            \ [ "Session C&lose\t,sc", 'SessionClose'],
            \ [ "--", ],
            \ [ "&Close\t(:bd)", 'bd' ],
            \ [ "--", ],
            \ [ "E&xit\t(:qa)", 'qa' ],
            \ ])

call quickui#menu#install("&Edit", [
            \ ['&Undo History', 'UndotreeToggle', ''],
            \ ['--'],
            \ ['&Paste %{&paste? "Disable":"Enable"}', 'set paste!', 'Toggle paste mode %{&paste? "off" : "on"}'],
            \ ['--'],
            \ ['&Trailing Space', 'call StripTrailingWhitespace()', ''],
            \ ['Format J&son', 'call FormatJson()', ''],
            \ ['&Align by Char', 'call feedkeys(":Tabularize /")', ''],
            \ ])

call quickui#menu#install('&Tools', [
            \ ["Display &Messages", 'call quickui#tools#display_messages()', ],
            \ ["List &Buffer\t<Ctrl-q>", 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
            \ ["List &Function\t<Ctrl-f>", 'call quickui#tools#list_function()'],
            \ ])

call quickui#menu#install('&Plugin', [
            \ ["&NERDTree\t<F2>", 'NERDTreeToggle', 'toggle nerdtree'],
            \ ["&Tagbar\t<F3>", 'TagbarToggle', 'toggle tagbar'],
            \ ["&SrcExpl\t<F4>", 'SrcExplToggle', 'toggle tagbar'],
            \ ["&LocList\t<F5>", 'call ToggleLocList()', 'toggle tagbar'],
            \ ['&Wordy', 'Wordy weak', ''],
            \ ])

call quickui#menu#install('Help (&?)', [
            \ ["&Index", 'tab help index', ''],
            \ ['Ti&ps', 'tab help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'tab help tutor', ''],
            \ ['&Quick Reference', 'tab help quickref', ''],
            \ ['&Summary', 'tab help summary', ''],
            \ ['--',''],
            \ ['&Vim Script', 'tab help eval', ''],
            \ ['&Function List', 'tab help function-list', ''],
            \ ], 10000)

"----------------------------------------------------------------------
" context menu
"----------------------------------------------------------------------
let g:context_menu_k = [
            \ ["&Toggle Errors\t<F5>", 'call ToggleLocList()'],
            \ [ "--", ],
            \ ["&Peek Definition\tCtrl+d", 'call quickui#tools#preview_tag("")'],
            \ ]

" display vim messages in the textbox
function! DisplayMessages()
    let x = ''
    redir => x
    silent! messages
    redir END
    let x = substitute(x, '[\n\r]\+\%$', '', 'g')
    let content = filter(split(x, "\n"), 'v:key != ""')
    let opts = {"close":"button", "title":"Vim Messages"}
    call quickui#textbox#open(content, opts)
endfunc
