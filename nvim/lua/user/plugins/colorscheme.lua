return {
  "tinted-theming/tinted-vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.tinted_bold = 0
    vim.cmd("colorscheme base16-gruvbox-dark-hard")
    vim.api.nvim_set_hl(0, "Comment", { fg = "#928374" })
  end,
}
