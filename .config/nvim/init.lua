require("config.options")
require("config.lazy")
require("config.mappings")
require("config.autocmds")

require("mini.align").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.git").setup()
require("mini.bracketed").setup()
require("ibl").setup()

require("telescope").load_extension("ui-select")

vim.notify = require("notify")
vim.cmd.colorscheme("dracula")
vim.cmd.highlight({ "WinSeparator", "guibg=None" })
vim.cmd.highlight({ "WinSeparator", "guifg=#44475A" })
vim.cmd.highlight({ "ColorColumn", "guibg=#44475A" })

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

local lsp_servers = {
  "lua",
  "typescript",
  "kotlin",
  "go",
  "rust",
  "templ",
  "python",
}

for _, server in next, lsp_servers do
  vim.lsp.enable(server)
end

local mason_tools = {
  "black",
  "gopls",
  "isort",
  "kotlin-lsp",
  "lua-language-server",
  "pgformatter",
  "python-lsp-server",
  "shfmt",
  "sqlfmt",
  "stylua",
  "tree-sitter-cli",
  "typescript-language-server",
}

for _, tool in next, mason_tools do
  local mason_registry = require("mason-registry")

  if not mason_registry.is_installed(tool) then
    vim.cmd({ cmd = "MasonInstall", args = { tool } })
  end
end
