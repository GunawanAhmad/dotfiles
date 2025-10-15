return {
  'crnvl96/lazydocker.nvim',
  opts = {
    window = {
      settings = {
        width = 0.718, -- Percentage of screen width (0 to 1)
        height = 0.718, -- Percentage of screen height (0 to 1)
        border = 'rounded', -- See ':h nvim_open_win' border options
        relative = 'editor', -- See ':h nvim_open_win' relative options
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function(_, opts) -- 1st change is here
    require('lazydocker').setup(opts)
    vim.keymap.set('n', '<leader>ld', "<Cmd>lua require('lazydocker').toggle({ engine = 'docker' })<CR>", { desc = '[L]azy [D]ocker', silent = true })
  end,
}
