-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" 

  -- lsp
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind-nvim'
  use 'williamboman/nvim-lsp-installer' -- lsp installer for different language servers
  use("jose-elias-alvarez/null-ls.nvim") -- for formatting, code actions

  -- treesitter for better syntax highlighting
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- for file type aware commenting

  use "folke/trouble.nvim"

  -- as long as problems with identation
  use 'sheerun/vim-polyglot'

  -- must have
  use 'tpope/vim-surround'
  use "numToStr/Comment.nvim" -- for commenting
  use("windwp/nvim-autopairs")

  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'

  -- colorscheme and status line
  use 'nvim-lualine/lualine.nvim'

  use("gruvbox-community/gruvbox")  
  use 'mhartington/oceanic-next'
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/sonokai'

  -- git
  use "tpope/vim-fugitive"

  -- pretty web icons
  use 'kyazdani42/nvim-web-devicons'

  -- tree explorer
  use 'kyazdani42/nvim-tree.lua'
end)
