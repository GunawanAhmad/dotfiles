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

-- Remap new arrow key to hjkl
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-l>", "<right>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("n", "<C-h>", "<left>")
vim.keymap.set("n", "<C-l>", "<right>")
vim.keymap.set("n", "<C-j>", "<down>")
vim.keymap.set("n", "<C-k>", "<up>")
vim.keymap.set("v", "<C-h>", "<left>")
vim.keymap.set("v", "<C-l>", "<right>")
vim.keymap.set("v", "<C-j>", "<down>")
vim.keymap.set("v", "<C-k>", "<up>")
