vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/dracula.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'kyazdani42/nvim-web-devicons' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-git'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'bronson/vim-trailing-whitespace'
  use 'scrooloose/nerdtree'
  use 'Lokaltog/vim-easymotion'
  use 'mileszs/ack.vim'
  use 'z0mbix/vim-shfmt'
end)
