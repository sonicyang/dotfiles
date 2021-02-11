" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
    finish
endif

let g:quickui_border_style = 2
let g:quickui_color_scheme = 'papercol dark'

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

call quickui#menu#install('&Symbol', [
            \ [ 'List &Function', 'call quickui#tools#list_function()', ],
            \ [ "&Grep Word\t(In Project)", 'call MenuHelp_GrepCode()', 'Grep keyword in current project' ],
            \ [ "--", ],
            \ [ "Find &Definition\t(GNU Global)", 'call MenuHelp_Gscope("g")', 'GNU Global search g'],
            \ [ "Find &Symbol\t(GNU Global)", 'call MenuHelp_Gscope("s")', 'GNU Gloal search s'],
            \ [ "Find &Called by\t(GNU Global)", 'call MenuHelp_Gscope("d")', 'GNU Global search d'],
            \ [ "Find C&alling\t(GNU Global)", 'call MenuHelp_Gscope("c")', 'GNU Global search c'],
            \ [ "Find &From Ctags\t(GNU Global)", 'call MenuHelp_Gscope("z")', 'GNU Global search c'],
            \ [ "--", ],
            \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
            \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
            \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
            \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
            \ ])

call quickui#menu#install('&Tools', [
            \ ['Display &Messages', 'call quickui#tools#display_messages()', ],
            \ ['List &Buffer', 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
            \ ])

call quickui#menu#install('&Plugin', [
            \ ["&NERDTree\t<F2>", 'NERDTreeToggle', 'toggle nerdtree'],
            \ ["&Tagbar\t<F3>", 'TagbarToggle', 'toggle tagbar'],
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
            \ ["S&earch in Project\t\\cx", 'exec "silent! GrepCode! " . expand("<cword>")'],
            \ [ "--", ],
            \ [ "Find &Definition\t\\cg", 'call MenuHelp_Fscope("g")', 'GNU Global search g'],
            \ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
            \ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
            \ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
            \ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
            \ [ "--", ],
            \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
            \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
            \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
            \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
            \ [ "--", ],
            \ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
            \ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
            \ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
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
