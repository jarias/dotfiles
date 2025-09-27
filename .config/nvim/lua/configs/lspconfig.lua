local servers = {
  htmx = {},
  graphql = {},
  terraformls = {},
  gopls = {},
  rust_analyzer = {},
  ts_ls = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
