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

local astro_group =
  vim.api.nvim_create_augroup("AstroIndentation", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = astro_group,
  pattern = "astro",
  callback = function()
    vim.bo.tabstop = 2 -- Number of spaces for a tab
    vim.bo.shiftwidth = 2 -- Indentation width
    vim.bo.softtabstop = 2 -- Spaces inserted for Tab in insert mode
    vim.bo.expandtab = true -- Use spaces instead of tabs
    print("Applied Astro-specific indentation settings.")
  end,
})

vim.filetype.add({
  extension = {
    mdx = "markdown", -- Treat MDX as markdown
  },
})
