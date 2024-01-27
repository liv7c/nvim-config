# My neovim config

Neovim config using LSP. All config files are written in Lua.
It uses `lazy.nvim` as a plugin manager.

## Requirements

There are a couple of dependencies necessary for this configuration to work.

- Install [`fd`](https://github.com/sharkdp/fd) and [`ripgrep`](https://github.com/BurntSushi/ripgrep). Those two packages are important for the Telescope plugin to work.
- This config has been tested with a version of `neovim` that is **at least** `0.9.2`. If you haven't installed or have an older version of neovim, check out the [neovim installation documentation](https://github.com/neovim/neovim/blob/master/INSTALL.md).

## Plugins used

Some of the plugins used:

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

If you feel like building your own config, here are some resources that I have found really helpful:

- [Neovim from scratch by chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ): great playlist to get started configuring neovim using lua.
- [Neovim from scratch repository](https://github.com/LunarVim/Neovim-from-scratch)
- [Configuring neovim by Tuff Gniuz](https://www.youtube.com/playlist?list=PLIHtvvGZ1O3jBXdp9Id02vRuOEOWIGB_w): another great series of videos on configuring neovim.
