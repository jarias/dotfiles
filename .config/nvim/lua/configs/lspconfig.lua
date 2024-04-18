-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "terraform" },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go" },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript" },
}
