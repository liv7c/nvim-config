vim.g.codedark_italics = 1
-- vim.g.gruvbox_material_background = "hard"

local status, _ = pcall(vim.cmd, "colorscheme codedark")
if not status then
	print("Colorscheme not installed")
	return
end
