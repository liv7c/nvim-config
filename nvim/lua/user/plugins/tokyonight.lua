-- Color scheme

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function(plugin, opts)
    require('tokyonight').setup(opts)

    vim.cmd('colorscheme tokyonight')
  end,
}
