vim.pack.add {
  'https://github.com/folke/flash.nvim',
}

vim.keymap.set('n', 's', function()
  require('flash').jump()
end, { desc = 'Flash' })

vim.keymap.set('n', 'S', function()
  require('flash').treesitter()
end, { desc = 'Flash Treesitter' })

vim.keymap.set('o', 'r', function()
  require('flash').remote()
end, { desc = 'Remote Flash' })

vim.keymap.set('o', 'R', function()
  require('flash').treesitter_search()
end, { desc = 'Treesitter Search' })

vim.keymap.set('c', '<c-s>', function()
  require('flash').toggle()
end, { desc = 'Toggle Flash Search' })

-- return {
--   'folke/flash.nvim',
--   event = 'VeryLazy',
--   ---@type Flash.Config
--   opts = {},
--   -- stylua: ignore
--   keys = {
--     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
--     { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
--     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
--   },
-- }
