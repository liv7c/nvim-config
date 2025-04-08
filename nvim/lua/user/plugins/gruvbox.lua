return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false, -- Load at startup
    priority = 1000, -- Load before other plugins
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
