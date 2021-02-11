" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')
    call dein#add('wsdjeg/dein-ui.vim')

    " Vim Scripting Utils
    call dein#add('MarcWeber/vim-addon-mw-utils')
    call dein#add('tomtom/tlib_vim')
    call dein#add('xolox/vim-misc')
    call dein#add('kana/vim-textobj-user')
    call dein#add('kana/vim-textobj-indent')
    call dein#add('mattn/webapi-vim')

    " Web services
    "call dein#add('mattn/gist-vim')

    " UI Color
    call dein#add('icymind/NeoSolarized')
    "call dein#add('altercation/vim-colors-solarized')
    call dein#add('spf13/vim-colors')
    call dein#add('flazz/vim-colorschemes')

    " UI Prettify
    " call dein#add('bling/vim-bufferline')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('powerline/fonts')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('osyo-manga/vim-over')
    call dein#add('luochen1990/rainbow')

    " General File Management
    call dein#add('preservim/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('tacahiroy/ctrlp-funky')

    " Git
    call dein#add('rhysd/conflict-marker.vim')
    call dein#add('mhinz/vim-signify')
    call dein#add('tpope/vim-fugitive')

    " Utils
    call dein#add('vim-scripts/sessionman.vim')
    call dein#add('mbbill/undotree')
    call dein#add('skywind3000/vim-quickui')

    " Selections and Motion
    call dein#add('easymotion/vim-easymotion')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('gcmt/wildfire.vim')

    call dein#add('reedes/vim-textobj-sentence')
    call dein#add('reedes/vim-textobj-quote')

    " General Editing
    call dein#add('tpope/vim-abolish.git')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-repeat')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('godlygeek/tabular')

    " Source browsing / cTag and cScope / Auto coloring
    call dein#add('chazy/cscope_maps')
    call dein#add('vim-scripts/taglist.vim')
    call dein#add('preservim/tagbar')
    call dein#add('wesleyche/SrcExpl')
    call dein#add('BenBergman/TagHighlight')
    call dein#add('ludovicchabant/vim-gutentags')
    "call dein#add('wesleyche/Trinity')

    " Autocomplete and Linting
    " call dein#add('Shougo/deoplete.nvim')
    call dein#add('dense-analysis/ale')
    call dein#add('neoclide/coc.nvim', {'branch': 'release'})

    let g:coc_global_extensions = [
        \'coc-git',
        \'coc-cmake',
        \'coc-highlight',
        \'coc-calc',
        \'coc-json',
        \'coc-html',
        \'coc-tsserver',
        \'coc-json',
        \'coc-clangd',
        \'coc-go',
        \'coc-sh',
        \'coc-pyright',
        \'coc-rls',
        \'coc-browser',
        \'coc-java',
        \'coc-xml',
        \'coc-yaml',
        \'coc-yank',
        \'coc-vimtex']

    " Text Document Files
    call dein#add('reedes/vim-litecorrect')
    call dein#add('reedes/vim-wordy')
    call dein#add('tpope/vim-markdown')

    " General Programming
    " call dein#add('tpope/vim-commentary')
    call dein#add('scrooloose/nerdcommenter')

    " Linter syntax checker
    " call dein#add('scrooloose/syntastic')
    " call dein#add('neomake/neomake')

    " Python
    " call dein#add('vim-scripts/pythoncomplete')
    call dein#add('klen/python-mode')
    call dein#add('yssource/python.vim')
    call dein#add('vim-scripts/python_match.vim')

    " Javascript
    " call dein#add('groenewege/vim-less')
    " call dein#add('pangloss/vim-javascript')
    " call dein#add('briancollins/vim-jst')
    " call dein#add('kchmck/vim-coffee-script')
    call dein#add('elzr/vim-json')

    " Misc
    " call dein#add('rust-lang/rust.vim')
    " call dein#add('tpope/vim-cucumber')
    " call dein#add('quentindecock/vim-cucumber-align-pipes')
    " call dein#add('saltstack/salt-vim')
    call dein#add('cespare/vim-toml')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif
