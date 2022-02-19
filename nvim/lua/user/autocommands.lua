vim.cmd [[
  augroup _go
    autocmd!
    autocmd FileType go setlocal noexpandtab
    autocmd FileType go setlocal shiftwidth=4
    autocmd FileType go setlocal softtabstop=4
    autocmd FileType go setlocal tabstop=4
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
]]
