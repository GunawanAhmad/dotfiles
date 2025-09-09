local function eslintFormat()
  if vim.fn.exists ':LspEslintFixAll' == 2 then
    vim.cmd 'LspEslintFixAll'
  end
  return {}
end

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
      javascript = eslintFormat,
      typescript = eslintFormat,
      javascriptreact = eslintFormat,
      typescriptreact = eslintFormat,
      vue = eslintFormat,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'never',
    },
  },
}
