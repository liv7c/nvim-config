local colorscheme = "github_*"
vim.g.oceanic_next_terminal_italic = 1
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

