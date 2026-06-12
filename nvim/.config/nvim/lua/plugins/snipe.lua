vim.pack.add {
  'https://github.com/leath-dub/snipe.nvim',
}

require('snipe').setup {
  ui = {
    position = 'center',
    persist_tasge = true,
  },
  hints = {
    dictionary = 'abcdefimnopsuvw',
  },
  navigate = {
    cancel_snipe = { 'q', '<esc>' },
  },
  sort = 'last',
}

vim.keymap.set('n', '<C-b>', function()
  require('snipe').open_buffer_menu()
end, { desc = 'Open Snipe buffer menu' })
