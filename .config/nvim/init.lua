require("config.options")
require("config.lazy")
require("config.mappings")

require("mini.align").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.git").setup()
require("mini.bracketed").setup()
require("ibl").setup()

require("telescope").load_extension("ui-select")

vim.cmd.colorscheme("dracula")

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

local lsp_servers = {
  "lua",
  "typescript",
  "kotlin",
  "go",
  "rust",
}

for _, server in next, lsp_servers do
  vim.lsp.enable(server)
end
