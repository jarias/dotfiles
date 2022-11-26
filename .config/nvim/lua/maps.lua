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

--map('n', '<space>e', vim.diagnostic.open_float, opts)
--map('n', '[d', vim.diagnostic.goto_prev, opts)
--map('n', ']d', vim.diagnostic.goto_next, opts)
--map('n', '<space>q', vim.diagnostic.setloclist, opts)
