local function load_persistence()
  vim.pack.add {
    'https://github.com/folke/persistence.nvim',
  }
  require('persistence').setup {}
end

load_persistence()
