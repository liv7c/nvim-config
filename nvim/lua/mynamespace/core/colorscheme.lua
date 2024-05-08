-- vim.g.gruvbox_material_background = "hard"
-- local colorscheme = "gruvbox-material"
local colorscheme = "kanagawa-wave"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	print("Colorscheme not installed")
	return
end
