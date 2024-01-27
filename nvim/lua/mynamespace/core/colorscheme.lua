local colorscheme = "gruvbox-material"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	print("Colorscheme not installed")
	return
end
