local colorscheme = "nightfox"

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
