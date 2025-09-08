return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[██████╗ ██╗   ██╗███╗   ██╗███████╗]],
          [[██╔════╝ ██║   ██║████╗  ██║██╔════╝]],
          [[██║  ███╗██║   ██║██╔██╗ ██║███████╗]],
          [[██║   ██║██║   ██║██║╚██╗██║╚════██║]],
          [[╚██████╔╝╚██████╔╝██║ ╚████║███████║]],
          [[╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝]],
          [[Back to Codegasm]],
          [[]],
          [[]],
          [[]],
        },
        center = {
          {
            icon = '  ',
            key = 'ff',
            desc = 'Find files',
            key_format = '    %s', -- remove default surrounding `[]`
            action = 'lua require("fff").find_files()',
          },
          {
            icon = '󰈭  ',
            desc = 'Find word',
            key = 'fw',
            key_format = '    %s', -- remove default surrounding `[]`
            action = 'Telescope live_grep',
          },
          {
            icon = '  ',
            desc = 'Sessions',
            key = 's',
            key_format = '    %s', -- remove default surrounding `[]`
            action = 'lua require("persistence").load()',
          },
        },
        footer = {
          [[]],
          [[]],
          '💡 Powered by Brain',
          [[]],
          '🚀 Stay',
        }, -- your footer
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
