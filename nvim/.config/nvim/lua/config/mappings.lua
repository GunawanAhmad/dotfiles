local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>', { desc = 'Back to normal mode' })

-- remap for halp page up and down
map('n', 'K', '<C-u>', { desc = 'Page up' })
map('n', 'J', '<C-d>', { desc = 'Page down' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Copy to system clipboard
map('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })

map('n', 'X', '<C-w>', { desc = 'Navigation prefix' })
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Navigate while in insert mode
map('i', '<C-h>', '<Left>', { desc = 'Navigate to left' })
map('i', '<C-l>', '<Right>', { desc = 'Navigate to right' })
map('i', '<C-j>', '<Down>', { desc = 'Navigate to down' })
map('i', '<C-k>', '<Up>', { desc = 'Navigate to up' })

-- cycle through buffer
map('n', '<Tab>', ':bnext<CR>', { desc = 'Go to next buffer' })
map('n', '<S-Tab>', ':bprev<CR>', { desc = 'Go to previous buffer' })
map('n', '<leader>x', ':bd<CR>', { desc = 'remove current buffer' })

-- Show definition on hover
map('n', '<C-h>', vim.lsp.buf.hover, { desc = 'Hover definition' })

-- Show diagnostic on popup
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Open diagnostic on popup' })

-- Select all
map('n', '<C-a>', 'ggvG', { desc = 'Select all text' })

map('n', '<leader>ai', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'Toggle code AI' })

-- mapping esc to escpace terminal mode
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
