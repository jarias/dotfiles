require("config.options")
require("config.lazy")
require("config.mappings")

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
