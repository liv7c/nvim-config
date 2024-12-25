return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
    config = function()
      vim.keymap.set("n", "<Leader>n", "<cmd>NvimTreeToggle<cr>")
      vim.keymap.set("n", "<Leader>nf", "<cmd>NvimTreeFindFileToggle<cr>")
      require("nvim-tree").setup({})
    end,
  },
}
