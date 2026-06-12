-- Lua
-- return {
--   'folke/persistence.nvim',
--   event = 'BufReadPre', -- this will only start session saving when an actual file was opened
--   opts = {
--     -- add any custom options here
--   },
-- }

vim.pack.add {
  { src = 'https://github.com/folke/persistence.nvim' },
}

require('persistence').setup {
  event = 'BufReadPre',
}

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.keymap.set('n', 's', ':lua require("persistence").load()<CR>')
    end
  end,
})
