-- vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.g.gruvbox_contrast_light = "hard"
-- vim.g.gruvbox_italic = 1
-- vim.g.gruvbox_transparent_bg = 1
-- local colorscheme = "gruvbox"
-- local colorscheme = "dracula"
vim.g.oceanic_next_terminal_italic = 1
vim.g.oceanic_next_terminal_bold = 0

local colorscheme = "OceanicNext"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	print("Colorscheme not installed")
	return
end

-- local cmd = vim.cmd
-- -- make background transparent
-- cmd([[highlight Normal guibg=none ctermbg=none]])
-- cmd([[highlight NonText guibg=none ctermbg=none]])

-- local hl = function(thing, opts)
-- 	vim.api.nvim_set_hl(0, thing, opts)
-- end

-- hl("SignColumn", {
-- 	bg = "none",
-- })

-- hl("CursorLineNR", {
-- 	bg = "None",
-- })

-- hl("Normal", {
-- 	bg = "none",
-- })
