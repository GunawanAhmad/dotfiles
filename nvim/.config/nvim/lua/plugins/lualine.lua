return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    options = {
      theme = 'gruvbox-material',
      extensions = {
        'nvim-tree',
      },
    }
    require('lualine').setup()
  end,
}
