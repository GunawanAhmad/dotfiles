vim.pack.add {
  'https://github.com/stevearc/conform.nvim',
}

local conform = require 'conform'
local eslint_filetypes = {
  javascript = true,
  typescript = true,
  javascriptreact = true,
  typescriptreact = true,
  vue = true,
}

conform.setup {
  notify_on_error = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    sql = { 'sql_formatter' },
    go = { 'goimports', 'gofmt' },
    bash = { 'shfmt' },
    python = { 'ruff_format' },
  },
  format_on_save = function(bufnr)
    if eslint_filetypes[vim.bo[bufnr].filetype] then
      return
    end

    return {
      timeout_ms = 500,
      lsp_format = 'fallback',
    }
  end,
}

vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
  conform.format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer' })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('eslint-fix-all-on-save', { clear = true }),
  callback = function(args)
    if not eslint_filetypes[vim.bo[args.buf].filetype] then
      return
    end

    if vim.fn.exists ':EslintFixAll' == 2 then
      vim.cmd.EslintFixAll()
    end
  end,
})
