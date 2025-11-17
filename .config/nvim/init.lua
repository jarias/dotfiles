require("config.options")
require("config.lazy")
require("config.mappings")

vim.cmd.colorscheme("dracula")

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})
vim.lsp.enable("lua_ls")
