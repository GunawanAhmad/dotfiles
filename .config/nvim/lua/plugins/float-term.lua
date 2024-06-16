return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set("n", "<C-t>", ":FloatermToggle <CR>")
    vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:FloatermToggle <CR>")
  end,
}
