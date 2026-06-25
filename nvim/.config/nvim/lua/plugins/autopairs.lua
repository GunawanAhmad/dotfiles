local autopairs_loaded = false

local function load_autopairs()
  if autopairs_loaded then
    return
  end
  autopairs_loaded = true

  vim.pack.add {
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/hrsh7th/nvim-cmp',
  }
  require('nvim-autopairs').setup {}
  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  local cmp = require 'cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = load_autopairs,
})
