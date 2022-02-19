local cmd = vim.cmd

-- make comments and HTML attributes italic
cmd [[highlight Comment cterm=italic term=italic gui=italic]]
cmd [[highlight htmlArg cterm=italic term=italic gui=italic]]
cmd [[highlight xmlAttrib cterm=italic term=italic gui=italic]]
