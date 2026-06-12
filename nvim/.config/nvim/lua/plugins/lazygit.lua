local load_lazygit = function()
  vim.pack.add {
    'https://github.com/kdheepak/lazygit.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
  }
end

vim.keymap.set('n', '<leader>lg', function()
  load_lazygit()
  vim.cmd 'LazyGit'
end, { silent = true })
