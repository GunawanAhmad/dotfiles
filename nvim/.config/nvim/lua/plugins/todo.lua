return {
  'gunawanahmad/todo.nvim',
  name = "todo.nvim",
  config = function()
    require("todo").setup({
      keymap = "<leader>td",
    })
  end,
}
