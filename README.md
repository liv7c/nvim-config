 # My neovim config

This configuration uses LSP, and all configuration files are written in Lua. I use `lazy.nvim` for plugin management.

## Requirements

First, you need to install [`fd`](https://github.com/sharkdp/fd) and [`ripgrep`](https://github.com/BurntSushi/ripgrep), as they are both necessary for the Telescope plugin to work. Telescope is a great fuzzy finder handy when navigating a code base.

Additionally, this configuration requires ** at least version 0.9.2 of neovim **. If you still need to install it or have an older version of neovim, you can check out the [neovim installation documentation](https://github.com/neovim/neovim/blob/master/INSTALL.md).

## Plugins used

Some of the plugins I use include:

- [lazy.nvim](https://github.com/folke/lazy.nvim): it is a plugin manager specifically developed for neovim ❤️
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason](https://github.com/williamboman/mason.nvim): to install and manage LSP language servers and formatters
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim): for formatting and linting
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): for syntax highlighting
- [telescope](https://github.com/nvim-telescope/telescope.nvim): for fuzzy finding
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua): a simple file explorer
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

## Further resources

If you're interested in building your neovim configuration, I recommend checking these resources:

- [Neovim from scratch by chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- [Neovim from scratch repository](https://github.com/LunarVim/Neovim-from-scratch)
- [Configuring neovim by Tuff Gniuz](https://www.youtube.com/playlist?list=PLIHtvvGZ1O3jBXdp9Id02vRuOEOWIGB_w)
