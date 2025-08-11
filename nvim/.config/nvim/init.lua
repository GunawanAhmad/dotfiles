local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { 'Bilal2453/luvit-meta', lazy = true },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  require 'plugins.autopairs',
  require 'plugins.themes.gruvbox',
  -- require 'plugins.themes.kanagawa-paper',
  -- require 'plugins.catppucin'
  require 'plugins.nvim-tree',
  require 'plugins.gitsigns',
  require 'plugins.lualine',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.conform',
  require 'plugins.cmp',
  require 'plugins.mini',
  require 'plugins.lsp',
  require 'plugins.treesitter',
  require 'plugins.startup',
  require 'plugins.sessions',
  require 'plugins.copilot',
  -- require 'plugins.markview',
  -- require 'plugins.supermaven',
  require 'plugins.debugprint',
  require 'plugins.nvim-colorizer',
  require 'plugins.flash',
  require 'plugins.yazi',
  -- require 'plugins.render-markdown',
  require 'plugins.snipe',
  require 'plugins.discord-presence',
  require 'plugins.fff',
  require 'plugins.codecompanion',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'config.options'
require 'config.mappings'
