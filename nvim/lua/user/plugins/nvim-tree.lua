return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
    config = function()
      local nvim_tree = require("nvim-tree")

      vim.keymap.set("n", "<Leader>n", "<cmd>NvimTreeToggle<cr>")
      vim.keymap.set("n", "<Leader>nf", "<cmd>NvimTreeFindFileToggle<cr>")
      vim.keymap.set("n", "<Leader>nr", "<cmd>NvimTreeRefresh<cr>")

      nvim_tree.setup({
        view = {
          width = 40,
          side = "right",
        },
      })
    end,
  },
}
