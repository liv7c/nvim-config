return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonUpdate" }, -- Lazy-load only when :Mason is used
  build = ":MasonUpdate",
  config = function()
    require("mason").setup({ ui = { height = 0.8 } })
  end,
}
