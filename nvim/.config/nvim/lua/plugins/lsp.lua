vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.pack.add { 'https://github.com/folke/lazydev.nvim' }
    require('lazydev').setup {}
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(keys, rhs, desc)
      vim.keymap.set('n', keys, rhs, { buffer = event.buf, desc = desc })
    end

    map('gd', require('telescope.builtin').lsp_definitions, 'Go to definition')
    map('gr', require('telescope.builtin').lsp_references, 'Go to references')
    map('gI', require('telescope.builtin').lsp_implementations, 'Go to implementations')
    map('rn', vim.lsp.buf.rename, 'Rename')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
    map('<C-h>', vim.lsp.buf.hover, 'Hover')
    map('<leader>e', vim.diagnostic.open_float, 'Show diagnostics')
  end,
})

vim.diagnostic.config {
  virtual_text = true, -- Show diagnostics inline
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'Error' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '⚠', texthl = 'Warning' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'Information' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'Hint' })

local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local servers = {
  vue_ls = {},
  svelte = {},
  vtsls = {
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            vue_plugin,
          },
        },
      },
    },
    filetypes = tsserver_filetypes,
  },
  lua_ls = {},
  gopls = {},
  clangd = {},
  golangci_lint_ls = {
    filetypes = { 'go', 'gomod' },
  },
  rust_analyzer = {},
  unocss = {},
  tailwindcss = {},
  pyrefly = {},
  yamlls = {},
  ruff = {},
}

local ensure_installed = {
  'vue-language-server',
  'svelte-language-server',
  'vtsls',
  'lua-language-server',
  'gopls',
  'clangd',
  'golangci-lint-langserver',
  'rust-analyzer',
  'unocss-language-server',
  'tailwindcss-language-server',
  'pyrefly',
  'yaml-language-server',
  'ruff',
  'stylua',
  'sql-formatter',
  'goimports',
  'shfmt',
  'tree-sitter-cli',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for server, server_config in pairs(servers) do
  server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})
  vim.lsp.config(server, server_config)
  vim.lsp.enable(server)
end

require('mason').setup()

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
}
