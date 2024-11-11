require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- remap for halp page up and down
map("n", "K", "<C-u>")
map("n", "J", "<C-d>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "esc", ":noh<return><esc>")

-- Copy to system clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("v", "<leader>Y", '"+Y')

map("n", "X", "<C-w>")

-- Remap new arrow key to hjkl
map("i", "<C-h>", "<left>")
map("i", "<C-l>", "<right>")
map("i", "<C-j>", "<down>")
map("i", "<C-k>", "<up>")
map("n", "<C-h>", "<left>")
map("n", "<C-l>", "<right>")
map("n", "<C-j>", "<down>")
map("n", "<C-k>", "<up>")
map("v", "<C-h>", "<left>")
map("v", "<C-l>", "<right>")
map("v", "<C-j>", "<down>")
map("v", "<C-k>", "<up>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
