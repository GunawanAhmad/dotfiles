return {
  -- 'gunawanahmad/todo.nvim',
  dir = '~/code/porn/todo.nvim',
  name = "todo.nvim",
  config = function()
    require("todo").setup({
      keymap = "<leader>td",
    })
  end,
}
