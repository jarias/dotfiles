return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "junegunn/vim-easy-align",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "configs.null-ls"
      end,
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "templ",
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
        "hcl",
        "liquid",
      },
    },
  },
  {
    "williamboman/mason.nvim",
  },
}
