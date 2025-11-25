vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").registers, { desc = "Telescope registers" })

vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Close Buffer", noremap = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>p",
  require("oil").toggle_float,
  { desc = "Open Mini Files", noremap = true, silent = true }
)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
    end

    bufmap("n", "<leader>gd", require("telescope.builtin").lsp_definitions)
    bufmap("n", "<leader>gy", require("telescope.builtin").lsp_type_definitions)
    bufmap("n", "<leader>grd", vim.lsp.buf.declaration)
    bufmap("n", "<leader>gi", require("telescope.builtin").lsp_implementations)
    bufmap("n", "<leader>rn", vim.lsp.buf.rename)
    bufmap("n", "<A-CR>", vim.lsp.buf.code_action)
  end,
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set({ "n", "t" }, "<A-h>", "<Cmd>ToggleHorizontalTerminal<CR>", { desc = "Toggle Horizontal Terminal" })
