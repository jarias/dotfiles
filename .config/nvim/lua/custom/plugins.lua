local plugins = {
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "bash",
        "terraform",
        "go",
        "java",
        "kotlin",
        "json",
        "sql",
        "rust",
        "javascript",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
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
      },
    },
  },
}
return plugins
