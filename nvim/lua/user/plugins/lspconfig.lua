-- lsp config

return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    -- Mason just to manage binaries
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_installation = true,
    })

    -- Capabilities (nvim-cmp)
    local capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    -- Helpers ---------------------------------------------------------------
    local function show_diagnostics_loclist()
      vim.diagnostic.setloclist({ open = false })
      vim.cmd("topleft 12 lopen")
    end

    local function on_attach(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- turn off server formatting (use null-ls/formatter instead)
      if client.server_capabilities.documentFormattingProvider then
        client.server_capabilities.documentFormattingProvider = false
      end
      if client.server_capabilities.documentRangeFormattingProvider then
        client.server_capabilities.documentRangeFormattingProvider = false
      end

      -- enable inlay hints if supported
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      -- keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end

    -- Base config applied to all servers
    local common = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- A tiny helper for root detection without lspconfig.util
    local function root_markers(markers)
      return { root_markers = markers }
    end

    -------------------------------------------------------------------------
    -- Server configs (new API): vim.lsp.config + vim.lsp.enable
    -------------------------------------------------------------------------
    local servers = {
      gopls = {
        settings = {
          gopls = { analyses = { unusedparams = true }, staticcheck = true },
        },
      },
      clangd = {},
      pylsp = {},
      ts_ls = {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
      },
      tailwindcss = {},
      jsonls = {
        settings = {
          json = { schemas = require("schemastore").json.schemas() },
        },
      },
      html = {},
      cssls = {},
      emmet_ls = {
        filetypes = {
          "html",
          "astro",
          "typescriptreact",
          "javascriptreact",
          "css",
          "sass",
          "scss",
          "less",
          "svelte",
          "handlebars",
          "template",
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
          },
        },
      },
      dockerls = { filetypes = { "dockerfile" } },
      docker_compose_language_service = {
        filetypes = { "yaml.docker-compose" },
      },
      eslint = vim.tbl_deep_extend(
        "force",
        root_markers({
          -- flat config (ESLint v9+)
          "eslint.config.js",
          "eslint.config.cjs",
          "eslint.config.mjs",
          "eslint.config.ts",
          -- legacy
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.json",
          ".eslintrc.cjs",
        }),
        {
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            vim.keymap.set(
              "n",
              "<leader>ca",
              vim.lsp.buf.code_action,
              { noremap = true, silent = true, buffer = bufnr }
            )
          end,
        }
      ),
      astro = vim.tbl_deep_extend(
        "force",
        root_markers({
          "package.json",
          "tsconfig.json",
          "jsconfig.json",
          ".git",
        }),
        { filetypes = { "astro" } }
      ),
      prismals = { settings = { prisma = { fileWatcher = true } } },
      stylelint_lsp = {
        settings = { stylelintplus = { autoFixOnFormat = false } },
        filetypes = { "css", "scss", "less" },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
          },
        },
      },
    }

    for name, cfg in pairs(servers) do
      vim.lsp.config(name, vim.tbl_deep_extend("force", common, cfg or {}))
      vim.lsp.enable(name)
    end

    -- Inlay hints styling
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#7c7c7c", italic = true })

    -- Diagnostics UI
    vim.keymap.set(
      "n",
      "<leader>d",
      show_diagnostics_loclist,
      { desc = "Show diagnostics (loclist)" }
    )
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.diagnostic.config({ virtual_text = true, float = { source = true } })

    -- Signs (keep your highlight groups)
    vim.fn.sign_define(
      "diagnosticsignerror",
      { text = "", texthl = "diagnosticsignerror" }
    )
    vim.fn.sign_define(
      "diagnosticsignwarn",
      { text = "", texthl = "diagnosticsignwarn" }
    )
    vim.fn.sign_define(
      "diagnosticsigninfo",
      { text = "", texthl = "diagnosticsigninfo" }
    )
    vim.fn.sign_define(
      "diagnosticsignhint",
      { text = "", texthl = "diagnosticsignhint" }
    )
  end,
}
