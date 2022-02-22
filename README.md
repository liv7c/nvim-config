# My neovim config

Neovim config using LSP (work in progress). All config files are written in Lua.

## Requirements

- This config works with a version of `neovim` that is **at least** `0.6.0`.
- You should also have `packer.nvim` installed. Check out [the installation instructions](https://github.com/wbthomason/packer.nvim#quickstart).

## Plugins used

Some of the plugins used:

- [packer](https://github.com/wbthomason/packer.nvim): plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer/): to install language servers more easily
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim): for formatting and linting
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): for syntax highlighting
- [telescope](https://github.com/nvim-telescope/telescope.nvim): for fuzzy finding
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua): file explorer
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

## Further resources

If you feel like building your own config, here are some resources that I found really helpful:

- [Neovim from scratch by chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ): great playlist to get started configuring neovim using lua.
- [Neovim from scratch repository](https://github.com/LunarVim/Neovim-from-scratch)
- [Configuring neovim by Tuff Gniuz](https://www.youtube.com/playlist?list=PLIHtvvGZ1O3jBXdp9Id02vRuOEOWIGB_w): another great series of videos on configuring neovim.
