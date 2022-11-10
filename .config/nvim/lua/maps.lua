local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', ',', '', {})
vim.g.mapleader = ','

map('n', '<leader>n', ':NERDTreeToggle<cr>', opts)

map('n', '<leader>b', "<cmd>Telescope buffers<cr>", opts)
map('n', '<leader>f', "<cmd>Telescope find_files<cr>", opts)
map('n', '<leader>g', "<cmd>Telescope live_grep<cr>", opts)

map('x', 'ga', '<Plug>(EasyAlign)', opts)
map('n', 'ga', '<Plug>(EasyAlign)', opts)

map('n', '<space>e', ':lua vim.diagnostic.open_float()<cr>', opts)
map('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', ':lua vim.diagnostic.setloclist()<CR>', opts)
