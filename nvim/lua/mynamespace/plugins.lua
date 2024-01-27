local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- colorscheme
	{
		"rose-pine/neovim",
		as = "rose-pine",
		styles = { italic = false },
	},
	-- essential plugins
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
	{
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icons
			},
	},
	-- tree + cooler status line
	{
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	{"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	},

	-- fuzzy finder
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",

	-- easier navigation
	"ThePrimeagen/harpoon",

	-- autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	-- snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- lsp
	-- for managing and installing lsp servers and formatters
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- for configuring lsp servers
	{ "neovim/nvim-lspconfig" },
	"hrsh7th/cmp-nvim-lsp", -- for autocompletio,
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename,file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletio,

	-- for formatting and linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- easier error navigation
	"folke/trouble.nvim",

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- git
	"tpope/vim-fugitive",
})
