vim.pack.add {
  'https://github.com/olimorris/codecompanion.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

require('codecompanion').setup {
  integrations = {
    telescope = false,
  },
  display = {
    cli = {
      window = {
        layout = 'vertical',
        width = 0.4,
        height = 0.4,
        opts = {
          list = false,
        },
      },
    },
  },
  interactions = {
    cli = {
      agent = 'claude_code',
      agents = {
        claude_code = {
          cmd = 'claude',
          args = {},
          description = 'Claude Code CLI',
          provider = 'terminal',
        },
      },
    },
  },
}

local function toggle_codecompanion()
  require('codecompanion').toggle()
end

vim.keymap.set('n', '<leader>ai', toggle_codecompanion, { desc = 'Toggle CodeCompanion', noremap = true, silent = true })
