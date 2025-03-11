" vim: set sw=4 ts=4 sts=4 et tw=78 spell:

call plug#begin()

" Vim Scripting Utils
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'lervag/vimtex'
Plug 'mattn/webapi-vim'

" Web services
"Plug 'mattn/gist-vim'

" UI Color
" Plug 'icymind/NeoSolarized'
" Plug 'altercation/vim-colors-solarized'
" Plug 'spf13/vim-colors'
Plug 'flazz/vim-colorschemes'
" Plug 'rafi/awesome-vim-colorschemes'

" UI Prettify
" Plug 'bling/vim-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'osyo-manga/vim-over'
Plug 'luochen1990/rainbow'

" General File Management
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'DavidEGx/ctrlp-smarttabs'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'mhinz/vim-signify'
" Plug 'tpope/vim-fugitive'

" Utils
Plug 'vim-scripts/sessionman.vim'
Plug 'mbbill/undotree'
"Plug 'skywind3000/vim-quickui'

" Selections and Motion
"Plug 'easymotion/vim-easymotion'
"Plug 'terryma/vim-multiple-cursors'
Plug 'gcmt/wildfire.vim'

" Plug 'reedes/vim-textobj-sentence'
" Plug 'reedes/vim-textobj-quote'

" General Editing
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'

" Source browsing / cTag and cScope / Auto coloring
" Plug 'chazy/cscope_maps'
" Plug 'vim-scripts/taglist.vim'
" Plug 'preservim/tagbar'
" Plug 'wesleyche/SrcExpl'
" Plug 'BenBergman/TagHighlight'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'wesleyche/Trinity'

" Autocomplete and Linting
" Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' }
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'folke/trouble.nvim'

" Text Document Files
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-wordy'
Plug 'tpope/vim-markdown'

" General Programming
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

" Linter syntax checker
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'

" Python
" Plug 'vim-scripts/pythoncomplete'
" Plug 'klen/python-mode'
" Plug 'yssource/python.vim'
" Plug 'vim-scripts/python_match.vim'

" Javascript
" Plug 'groenewege/vim-less'
" Plug 'pangloss/vim-javascript'
" Plug 'briancollins/vim-jst'
" Plug 'kchmck/vim-coffee-script'a
Plug 'elzr/vim-json'

" Misc
" Plug 'rust-lang/rust.vim'
" Plug 'tpope/vim-cucumber'
" Plug 'quentindecock/vim-cucumber-align-pipes'
" Plug 'saltstack/salt-vim'
Plug 'cespare/vim-toml'

call plug#end()

exec 'source' home . '/.config/nvim/plugin.lua'

" let g:coc_global_extensions = ['coc-git','coc-cmake','coc-highlight','coc-calc','coc-json','coc-html','coc-tsserver','coc-json','coc-clangd','coc-go','coc-sh','coc-pyright','coc-browser','coc-java','coc-xml','coc-yaml','coc-yank','coc-vimtex', 'coc-rust-analyzer', 'coc-pyright']
" le'ct g:coc_node_path = "/usr/bin/node"
