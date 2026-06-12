return {
  -- dir = '/home/guns/code/porn/fff.nvim',
  'dmtrKovalenko/fff.nvim',
  build = function()
    require('fff.download').download_or_build_binary()
  end,
  -- or if you are using nixos
  -- build = "nix run .#release",
  opts = {
    -- pass here all the options
    keymaps = {
      move_up = { '<C-k>', '<Up>' },
      move_down = { '<C-j>', '<Down>' },
    },
    debug = {
      enabled = true,
      show_scores = false,
    },
    title = 'Find files',
    prompt = ' ',
    layout = {
      width = 0.8,
    },
    preview = {
      enabled = true,
      show_file_info = true,
    },
  },
  keys = {
    {
      'ff',
      function()
        require('fff').find_files() -- or find_in_git_root() if
      end,
      desc = 'Open file picker',
    },
    { "fg", function() require('fff').live_grep() end, desc = 'LiFFFe grep' },
    {
      "fz",
      function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
      desc = 'Live fffuzy grep',
    },
    {
      "fc",
      function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end,
      desc = 'Search current word',
    },
  },
}
