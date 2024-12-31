local group = vim.api.nvim_create_augroup("CustomIndentation", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "go", "python", "rust" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true -- Ensure spaces are used instead of tabs
  end,
})

vim.filetype.add({
  extension = {
    mdx = "markdown", -- Treat MDX as markdown
  },
})
