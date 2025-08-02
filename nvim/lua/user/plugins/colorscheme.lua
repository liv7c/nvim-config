return {
  "tinted-theming/tinted-vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.tinted_bold = 0
    vim.cmd("colorscheme base16-gruvbox-dark-hard")
  end,
}
