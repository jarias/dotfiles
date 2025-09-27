return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
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
        "go",
        "java",
        "kotlin",
        "json",
        "sql",
        "rust",
        "javascript",
        "hcl",
        "liquid",
        "graphql",
        "embedded_template",
      },
    },
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      "brianhuster/autosave.nvim",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "echasnovski/mini.pick",
    },
    ft = { "asciidoc" },
  },
}
