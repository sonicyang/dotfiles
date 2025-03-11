-- Install Linters, formatter, LSPs
require("mason").setup{
    ensure_installed = {
        "vale",
        "bash-language-server",
        "black",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "cmakelint",
        "cpplint",
        "json-lsp",
        "jsonlint",
        "mypy",
        "pylint",
        "pyright",
        "ruff",
        "yaml-language-server",
        "yamlfmt",
        "yamllint"
    },
}

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Set Root dir pattern
local root_pattern = require('lspconfig.util').root_pattern
require('lspconfig').pyright.setup({
  root_dir = root_pattern('.git'),
})

-- Enable LSPs
require('lspconfig').lua_ls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').clangd.setup({ filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto","hpp", "h"},})
require('lspconfig').cmake.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').yamlls.setup({})
-- require('lspconfig').ccls.setup{ # Replaced by clangd
--   init_options = {
--       compilationDatabaseDirectory = "build";
--       index = {
--         threads = 0;
--       };
--       clang = {
--         excludeArgs = { "" } ;
--       };
--     }
-- }

-- Enable auto-complete
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

-- Enable diagnostic messages
vim.diagnostic.config({
  virtual_text = true,
})
require('trouble').setup()

-- Enable linters
require('lint').linters_by_ft = {
  cpp = {'cpplint'},
  c = {'cpplint'},
  python = {'pylint', 'mypy'},
  cmake = {'cmakelint'},
  json = {'jsonlint'},
}

-- Linter configs
local cpplint = require('lint').linters.cpplint
cpplint.args = {
  '-filter="-readability/nolint,-legal/copyright,-build/c++11,-build/include_subdir,-build/header_guard,-runtime/string,-runtime/references"',
  '--linelength=120'
}
