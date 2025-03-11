" vim: set sw=4 ts=4 sts=4 et tw=78 spell:
"
let g:TagHighlightSettings = {}
let g:TagHighlightSettings['DisableTagManager'] = 1
let g:TagHighlightSettings['DoNotGenerateTags'] = 1

let g:TagHighlightSettings['LanguageDetectionMethods'] =
			\ ['Extension', 'FileType']
let g:TagHighlightSettings['FileTypeLanguageOverrides'] =
    \ {'tagbar': 'c'}
