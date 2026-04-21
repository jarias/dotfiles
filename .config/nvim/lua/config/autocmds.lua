local file_types = {
  "templ",
  "css",
  "java",
  "kotlin",
  "toml",
  "lua",
  "json",
  "jsonc",
  "sh",
  "go",
  "python",
  "sql",
  "html",
  "javascript",
  "typescript",
}

for _, ft in next, file_types do
  vim.api.nvim_create_autocmd("FileType", {

    pattern = ft,
    callback = function()
      vim.treesitter.start()
    end,
  })
end
