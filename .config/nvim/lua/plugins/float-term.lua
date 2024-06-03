return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set("n", "<C-`>", ":FloatermToggle <CR>")
    vim.keymap.set("t", "<C-`>", "<C-\\><C-n>:FloatermToggle <CR>")
  end,
}
