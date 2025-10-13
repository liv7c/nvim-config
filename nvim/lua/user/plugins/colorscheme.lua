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
return {
  "AlexvZyl/nordic.nvim",
  -- "tinted-theming/tinted-vim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      on_highlight = function(highlights)
        -- Make Visual selection clearly visible
        highlights.Visual = {
          bg = "#3c4043",
          fg = nil,
        }
        highlights.VisualNOS = {
          bg = "#3c4043",
        }
        highlights.Comment = {
          fg = "#7C8489",
          italic = true,
        }
      end,
    })
    require("nordic").load()
    -- vim.g.tinted_bold = 0
    -- vim.cmd("colorscheme base16-gruvbox-dark-hard")
    -- vim.api.nvim_set_hl(0, "Comment", { fg = "#928374" })
  end,
}
