return {
  dir = vim.fn.expand("~/code/porn/nx.nvim"),
  -- 'gunawanahmad/nx.nvim',
  name = "nx.nvim",
  config = function()
    require("nx").setup({
      terminal = "horizontal",
    })
  end,
}
