-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
}

M.mason = {
  pkgs = {
    "terraform-ls",
    "lua-language-server",
    "stylua",
    "shfmt",
    "shellcheck",
    "prettier",
    "sqlfmt",
    "gopls",
    "goimports",
    "rust-analyzer",
    "typescript-language-server",
    "htmx-lsp",
    "prettier",
  },
}

return M
