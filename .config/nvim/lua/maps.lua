local builtin = require('telescope.builtin')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', ',', '', {})
vim.g.mapleader = ','

map('n', '<leader>n', ':NERDTreeToggle<cr>', opts)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

map('x', 'ga', '<Plug>(EasyAlign)', opts)
map('n', 'ga', '<Plug>(EasyAlign)', opts)

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "j", "gj", { buffer = 0 })
vim.keymap.set("n", "k", "gk", { buffer = 0 })
