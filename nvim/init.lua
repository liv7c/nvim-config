require("olivia.plugins")

-- core configuration
require("olivia.core.options")
require("olivia.core.keymaps")
require("olivia.core.colorscheme")

-- plugins
require("olivia.plugins.comment")
require("olivia.plugins.nvim-tree")
require("olivia.plugins.lualine")
require("olivia.plugins.telescope")
require("olivia.plugins.nvim-cmp")
require("olivia.plugins.trouble")
require("olivia.plugins.autopairs")
require("olivia.plugins.treesitter")

-- lsp
require("olivia.plugins.lsp.mason")
require("olivia.plugins.lsp.lsp-config")
require("olivia.plugins.lsp.null-ls")
