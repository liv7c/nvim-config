-- local colorscheme = "github_*"
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_italic = 1
vim.g.gruvbox_transparent_bg = 1
local colorscheme = "gruvbox"
-- vim.g.nord_contrast = fals
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true
-- local colorscheme = "nord"

-- `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`,
-- vim.g.sonokai_style = 'maia'
-- vim.g.sonokai_better_performance = 1
-- vim.g.sonokai_enable_italic = 1
-- local colorscheme = "sonokai"

-- vim.g.material_style = "deep ocean"
-- local colorscheme = "material"
-- vim.g.oceanic_next_terminal_italic = 1
-- local colorscheme = "OceanicNext"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

