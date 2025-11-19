local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Close Buffer", noremap = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>ed",
  "<Cmd>lua MiniFiles.open()<CR>",
  { desc = "Open Mini Files", noremap = true, silent = true }
)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
    end

    -- These are custom keymaps
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  end,
})
