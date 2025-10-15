return {
  dir = '/home/guns/code/porn/endpoint.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim', -- Optional: only needed if using telescope picker
  },
  cmd = { 'Endpoint' },
  config = function()
    require('endpoint').setup {
      -- Cache configuration
      cache_mode = 'none', -- "none" (real-time), "session", "persistent"
      debug = false,

      -- Picker configuration
      picker = 'telescope', -- "telescope", "vim_ui_select" ("snacks" in development)

      -- UI configuration
      ui = {
        show_icons = true, -- Show method icons
        show_method = true, -- Show method text (GET, POST, etc.)

        -- Method icons
        method_icons = {
          GET = '📥',
          POST = '📤',
          PUT = '✏️',
          DELETE = '🗑️',
          PATCH = '🔧',
        },

        -- Method colors (highlight groups)
        method_colors = {
          GET = 'TelescopeResultsNumber',
          POST = 'TelescopeResultsConstant',
          PUT = 'TelescopeResultsKeyword',
          DELETE = 'TelescopeResultsSpecialChar',
          PATCH = 'TelescopeResultsFunction',
        },
      },
    }
  end,
}
