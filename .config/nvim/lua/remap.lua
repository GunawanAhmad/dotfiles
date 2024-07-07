-- remap for halp page up and down
vim.keymap.set("n", "K", "<C-u>")
vim.keymap.set("n", "J", "<C-d>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "esc", ":noh<return><esc>")

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "X", "<C-w>")

