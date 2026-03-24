return {
  'esmuellert/nvim-eslint',
  config = function()
    require('nvim-eslint').setup({
      settings = {
        codeActionOnSave = {
          mode = 'all',
        },
        format = true,
      }
    })

    vim.api.nvim_create_user_command("EslintFixAll", function()
      local clients = vim.lsp.get_active_clients({ name = "eslint" })
      if #clients == 0 then
        print("ESLint LSP not attached")
        return
      end

      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.fixAll.eslint" },
        },
      })
    end, {})
  end,
}
