return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      overrides = function(colors)
        return {
          SignColumn = { bg = "none" },
          LineNr = { bg = "none" },
          CursorLineNr = { bg = "none", fg = colors.theme.syn.constant }, -- optional: customize fg
        }
      end,
    })
    vim.cmd([[colorscheme kanagawa]])
  end,
}
