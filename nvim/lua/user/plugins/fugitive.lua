-- Git commands.
return {
  "tpope/vim-fugitive",
  dependencies = { "tpope/vim-rhubarb" },
  config = function()
    vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
    vim.keymap.set(
      "n",
      "<leader>gc",
      ":Git commit<CR>",
      { desc = "Git commit" }
    )
    vim.keymap.set(
      "n",
      "<leader>ga",
      ":Git add %<CR>",
      { desc = "Git add current file" }
    )
  end,
}
