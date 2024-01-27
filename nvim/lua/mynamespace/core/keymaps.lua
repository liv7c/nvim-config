local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--------------
-- Normal --
--------------

-- paste without losing content in the registry
keymap("n", "<leader>d", '"_d', opts)

-- back and forth navigation
keymap("n", ",,", "<C-^>", opts)

-- Better window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate quick fix list
keymap("n", "<C-k>", ":cnext<CR>", opts)
keymap("n", "<C-j>", ":cprev<CR>", opts)

-- copy the rest of the line from the location you are in the line
keymap("n", "Y", "y$", opts)

-- make file executable
keymap("n", "<leader>x", ":!chmod +x %<CR>", opts)

-- quicker replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- copy file path to the clipboard
keymap("n", "<leader>cp", ':let @+ = expand("%:p")<CR>', opts)

-------------
-- Visual --
-------------
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- paste without losing content in the registry
keymap("v", "<leader>p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- paste without losing content in the registry
keymap("x", "<leader>p", '"_dP', opts)

----------------------
-- Plugins related ---
----------------------

-- nvim tree
keymap("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", opts)

-- telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>lR", "<cmd>Telescope lsp_references<cr>", opts)

-- trouble :)
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "<leader>gR", "<cmd>Trouble lsp_references<cr>", opts)

-- git fugitive
keymap("n", "<leader>gs", "<cmd>G<cr>", opts)
keymap("n", "<leader>gh", "<cmd>diffget //3<cr>", opts)
keymap("n", "<leader>gf", "<cmd>diffget //2<cr>", opts)
