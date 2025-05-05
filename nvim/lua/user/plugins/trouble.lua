return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>",
      desc = "Document Diagnostics",
    },
    {
      "<leader>xw",
      "<cmd>Trouble diagnostics toggle focus=true<CR>",
      desc = "Workspace Diagnostics",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<CR>",
      desc = "Location List",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<CR>",
      desc = "Quickfix List",
    },
  },
  config = function()
    require("trouble").setup({})
  end,
}
