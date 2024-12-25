return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      go = {"gofmt"}, -- Add Go formatters
      python = { "black", "ruff", stop_after_first = true }, -- Add Python formatters
      php = { "pint", "php_cs_fixer" },
      javascript = {"prettierd", "prettier", "eslint_d", stop_after_first = true },
      typescript = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
    },
    format_on_save = {
      timeout_ms = 1000,
    },
  },
}
