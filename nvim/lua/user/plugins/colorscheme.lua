-- return {
--       'sainnhe/sonokai',
--       lazy = false,
--       priority = 1000,
--       config = function()
--         -- Optionally configure and load the colorscheme
--         -- directly inside the plugin declaration.
--         vim.g.sonokai_enable_italic = true
--         vim.cmd.colorscheme('sonokai')
--       end
-- }
-- return {
--   "jonathanfilip/vim-lucius",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("lucius")
--     -- Match the gutter background with the editor background
--     vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
--     vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
--     vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "NONE" })
--     vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "NONE" })
--     -- Set indent-blankline highlight groups
--     vim.api.nvim_set_hl(0, "IblScope", { fg = "#5f87af" })
--   end,
-- }

return {
  "tinted-theming/tinted-vim",
  lazy = false,
  config = function()
    vim.g.tinted_bold = 0
    vim.cmd("colorscheme base16-gruvbox-dark-hard")
    vim.api.nvim_set_hl(0, "Comment", { fg = "#928374" })
  end,
}

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine-moon")
--   end,
-- }
