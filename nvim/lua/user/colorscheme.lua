-- local colorscheme = "github_*"
--[[ local colorscheme = "gruvbox" ]]
--[[ vim.g.gruvbox_contrast_dark = 'hard' ]]
--[[ vim.g.gruvbox_italic = 1 ]]
-- vim.g.nord_contrast = fals
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true
-- local colorscheme = "nord"

vim.g.material_style = "palenight"
local colorscheme = "material"
-- local colorscheme = "monokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

