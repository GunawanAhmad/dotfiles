return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function()
        vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Go to definition' })
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Go to references' })
        vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = 'Go to implementations' })
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = 'Rename' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
        vim.keymap.set('n', '<C-h>', vim.lsp.buf.hover, { desc = 'Hover' })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
      end,
    })

    vim.diagnostic.config {
      virtual_text = true, -- Show diagnostics inline
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }

    -- change diagnostic signs
    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'Error' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '⚠', texthl = 'Warning' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'Information' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'Hint' })

    local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
        '/vue-language-server' .. '/node_modules/@vue/language-server'
    local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }

    local vtsls_config = {
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
    }

    -- local ts_ls_config = {
    --   init_options = {
    --     plugins = {
    --       vue_plugin,
    --     },
    --   },
    --   filetypes = tsserver_filetypes,
    -- }
    --

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = 0,
      callback = function()
        local clients = vim.lsp.get_active_clients { bufnr = 0 }
        if #clients > 0 then
          vim.lsp.buf.format { async = false, timeout_ms = 1000 }
        else
          print 'No LSP client attached for formatting'
        end
      end,
    })

    local config = {
      vue_ls = {},
      svelte = {},
      vtsls = vtsls_config,
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      },
      gopls = {},
      eslint = {},
      clangd = {},
      golangci_lint_ls = {
        filetypes = { 'go', 'gomod' },
      },
      rust_analyzer = {},
      unocss = {},
      pyright = {},
    }

    -- load each config into the lsp
    for server, server_config in pairs(config) do
      vim.lsp.config(server, server_config)
      -- enable the server
      vim.lsp.enable { server }
    end

    require('mason').setup {
      ensure_installed = {
        'vue-language-server',
        'lua-language-server',
        'svelte-language-server',
        'gopls',
        'eslint',
        'clangd',
        'golangci-lint',
        'rust-analyzer',
        'unocss-language-server',
        'sql-formatter'
      },
    }
    local ensure_installed = vim.tbl_keys(config or {})
    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup { config }
        end,
      },
    }
  end,
}
