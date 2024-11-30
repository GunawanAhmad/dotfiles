require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Back to normal mode" })

-- remap for halp page up and down
map("n", "K", "<C-u>", { desc = "Page up" })
map("n", "J", "<C-d>", { desc = "Page down" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Copy to system clipboard
map("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

map("n", "X", "<C-w>", { desc = "Navigation prefix" })

map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map("n", "<C-h>", vim.lsp.buf.hover, { desc = "Hover definition" })

map("n", "gd", vim.lsp.buf.definition, {})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
