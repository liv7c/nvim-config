require("mynamespace.plugins")

-- core configuration
require("mynamespace.core.options")
require("mynamespace.core.keymaps")
require("mynamespace.core.colorscheme")

-- plugins
require("mynamespace.plugins.comment")
require("mynamespace.plugins.nvim-tree")
require("mynamespace.plugins.lualine")
require("mynamespace.plugins.telescope")
require("mynamespace.plugins.nvim-cmp")
require("mynamespace.plugins.trouble")
require("mynamespace.plugins.autopairs")
require("mynamespace.plugins.treesitter")
require("mynamespace.plugins.harpoon")

-- lsp
require("mynamespace.plugins.lsp.mason")
require("mynamespace.plugins.lsp.lsp-config")
require("mynamespace.plugins.lsp.null-ls")
