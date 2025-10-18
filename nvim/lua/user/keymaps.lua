-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlighting with escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Close all open buffers
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")

-- easier navigation
vim.keymap.set("n", ",,", "<C-^>", { noremap = true, silent = true })

-- Diagnostics.
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })

-- Location list
vim.keymap.set(
  "n",
  "<leader>ll",
  "<cmd>lopen<CR>",
  { desc = "Open location list" }
)
vim.keymap.set(
  "n",
  "<leader>lc",
  "<cmd>lclose<CR>",
  { desc = "Close location list" }
)

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
local opts = { noremap = true, silent = true }

vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- easier navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)

-- copy current file path
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy file path to clipboard" })

-- toggle relative line numbers
vim.keymap.set("n", "<leader>tr", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })
