return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      '<C-b>',
      function()
        require('snipe').open_buffer_menu()
      end,
      desc = 'Open Snipe buffer menu',
    },
  },
  opts = {
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
  },
}
