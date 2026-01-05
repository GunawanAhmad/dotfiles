return {
  dir = '/home/guns/code/porn/fff.nvim',
  build = 'cargo build --release',
  -- or if you are using nixos
  -- build = "nix run .#release",
  opts = {
    -- pass here all the options
    keymaps = {
      move_up = { '<C-k>', '<Up>' },
      move_down = { '<C-j>', '<Down>' },
    },
    debug = {
      enabled = false,
      show_scores = false,
    },
    title = 'Find files',
    prompt = ' ',
    layout = {
      width = 0.4,
    },
    preview = {
      enabled = false,
      -- show_file_info = true,
    },
  },
  keys = {
    {
      'ff', -- try it if you didn't it is a banger keybinding for a picker
      function()
        require('fff').find_files() -- or find_in_git_root() if
      end,
      desc = 'Open file picker',
    },
  },
}
