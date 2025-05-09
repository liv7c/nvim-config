local o = vim.opt

------------------
-- the basics
----------------
-- o.background = "light"
o.background = "dark"
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.tabstop = 2 -- insert 2 spaces for a tab

o.cursorline = false -- highlight the current line
o.number = true -- set numbered lines
o.relativenumber = true -- set relative numbered lines
o.numberwidth = 2 -- set number column width to 2 {default 4}
o.signcolumn = "yes:2" -- always show the sign column, otherwise it would shift the text each time

vim.opt.wrap = true
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.linebreak = true -- wrap at word boundaries
o.scrolloff = 8 -- scroll off
o.sidescrolloff = 8
o.cmdheight = 1 -- more space in the neovim command line for displaying messages

o.showmode = true -- show mode e.g. -- INSERT --
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.showtabline = 0 -- do not show tab line
o.clipboard = "unnamedplus" -- this one changes everything...allows neovim to access the system clipboard

o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

o.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them

o.title = true
o.mouse = "a" -- enable mouse for all modes

o.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }

-----------------
-- backup
-----------------
o.backup = false -- creates a backup file
o.swapfile = false -- creates a swapfile
o.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.pumheight = 10 -- pop up menu height
o.shell = "bash" -- bash, always...

-----------------------
-- search related
-----------------------
o.hlsearch = false -- remove highlight search
o.incsearch = true -- set incremental search
o.ignorecase = true -- ignore case in search patterns
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
