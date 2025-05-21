-- Multi select and multi cursor

return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_maps = {
      ["Add Cursor Down"] = "<C-j>", -- Ctrl+j to add cursor down
      ["Add Cursor Up"] = "<C-k>", -- Ctrl+k to add cursor up
    }
  end,
}
