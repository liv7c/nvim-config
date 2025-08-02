# Neovim Configuration

This is my personal Neovim configuration. It uses a variety of plugins, including LSP (Language Server Protocol), Mason (to install language servers more easily), `conform`, `cmp`, and more, to enhance the editor's functionality. It is written entirely in Lua.

## Features

- **LSP (Language Server Protocol)**: Provides powerful language support, including autocompletion, diagnostics, go-to-definition, and more.
- **`conform`**: A plugin for code formatting that supports multiple linters and formatters.
- **`cmp`**: A completion plugin for advanced autocompletion functionality.
- Additional plugins for Git integration, easier file navigation (via [Telescope](https://github.com/nvim-telescope/telescope.nvim)), and more.

## Directory Structure

- `nvim/lua/user/plugins`: Folder containing all the plugins. Each plugin has its own file that contains custom settings or keymaps.
- `nvim/lua/user/options.lua`: Stores Neovim options and settings.
- `nvim/lua/user/keymaps.lua`: Contains custom key mappings.
- `install.sh`: A script to set up the configuration.

## Installation

To set up this Neovim configuration, follow these steps:

1. **Clone the repository**:

    ```sh
    git clone git@github.com:liv7c/nvim-config.git ~/nvim-config
    ```

2. **Run the installation script**:

    You can use the provided `install` script to automate the setup process. This script will remove any existing Neovim configuration and link your custom config.

    ```sh
    ./install
    ```

    After running the script, your Neovim configuration will be set up and ready to use.

3. **Install Plugins**:

    After setting up the configuration, open Neovim. The plugin manager [LazyVim](https://github.com/LazyVim/LazyVim) will automatically install all the necessary plugins.

4. **Install Language Servers** (Optional):

    The configuration uses [Mason](https://github.com/williamboman/mason.nvim) to make it easier to install language servers. You can customize the `lspconfig.lua` file to add or remove any LSP server according to your needs.

## Customizing

- **Options**: Modify global Neovim options in `nvim/lua/user/options.lua`.
- **Keymaps**: Custom keymaps are defined in `nvim/lua/user/keymaps.lua`. You can modify or add new keybindings there.
- **Plugins**: To add or remove plugins, add or remove plugins in `nvim/lua/user/plugins`.

## Usage

Once the configuration is installed, you can start using Neovim with all the features enabled. The configuration will automatically load the LSP for supported languages, offer autocompletion with `cmp`, and format code using `conform`.

> If you need to support additional file types, you can modify the `nvim/lua/user/plugins/conform.lua` file. Format on save is enabled by default.

### Key Bindings

Here are a few of the custom keybindings:

- `gd`: Go to definition (LSP)
- `gr`: Find references (LSP)
- `K`: Show documentation (LSP)
- `<C-P>`: Search for a file (Telescope)
- `<Leader>b`: View all buffers (Telescope)
- `<Leader>sg`: Grep for a word (Telescope)
- `<Leader>rn`: Rename a symbol (LSP)
- `<Leader>ca`: Trigger code actions (LSP)

## References

Some great Neovim configurations to get started:

- [Jess Archer's dotfiles](https://github.com/jessarcher/dotfiles)
- [Gary Bernhardt's dotfiles](https://github.com/garybernhardt/dotfiles)

