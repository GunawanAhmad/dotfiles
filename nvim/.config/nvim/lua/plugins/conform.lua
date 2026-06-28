local function jsFormat()
  if vim.fn.exists ':EslintFixAll' == 2 then
    vim.cmd 'EslintFixAll'
  end
  return {}
end

vim.pack.add {
  'https://github.com/stevearc/conform.nvim',
}

require('conform').setup {
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  notify_on_error = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    sql = { 'sql_formatter' },
    go = { 'goimports', 'gofmt' },
    bash = { 'shfmt' },
    python = { 'ruff_format' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'never',
  },
}

return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      sql = { 'sql_formatter' },
      go = { 'goimports', 'gofmt' },
      javascript = jsFormat,
      typescript = jsFormat,
      javascriptreact = jsFormat,
      typescriptreact = jsFormat,
      vue = jsFormat,
      bash = { 'shfmt' },
      python = { 'ruff_format' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'never',
    },
  },
}
