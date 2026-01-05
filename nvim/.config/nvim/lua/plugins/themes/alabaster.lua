return {
  "p00f/alabaster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("alabaster").setup({
      -- Your config goes here
      vim.cmd.colorscheme("alabaster")
    })
  end,
}
