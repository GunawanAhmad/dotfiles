vim.pack.add {
  'https://github.com/esmuellert/nvim-eslint',
}

require('nvim-eslint').setup {
  settings = {
    codeActionOnSave = {
      mode = 'all',
    },
    format = true,
  },
}

local function eslint_fix_all(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients { name = 'eslint', bufnr = bufnr }
  if #clients == 0 then
    print 'ESLint LSP not attached'
    return
  end

  for _, client in ipairs(clients) do
    local encoding = client.offset_encoding or 'utf-16'
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    local params = {
      textDocument = vim.lsp.util.make_text_document_params(bufnr),
      range = {
        start = { line = 0, character = 0 },
        ['end'] = { line = line_count, character = 0 },
      },
      context = {
        diagnostics = vim.diagnostic.get(bufnr),
        only = { 'source.fixAll.eslint' },
        triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Automatic,
      },
    }

    local response = client:request_sync('textDocument/codeAction', params, 1000, bufnr)
    if not response or response.err or not response.result then
      return
    end

    for _, action in ipairs(response.result) do
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit, encoding)
      end

      local command = action.command or action
      if command.command then
        client:request_sync('workspace/executeCommand', command, 1000, bufnr)
      end
    end
  end
end

vim.api.nvim_create_user_command('EslintFixAll', function()
  eslint_fix_all()
end, {})
