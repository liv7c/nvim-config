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
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    -- Setup Mason for managing LSP servers
    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_installation = true,
      automatic_enable = false,
    })

    -- Define capabilities for autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    -- Function to show all buffer diagnostics in location list (vim-go style)
    local function show_diagnostics_loclist()
      vim.diagnostic.setloclist({ open = false })
      vim.cmd("topleft 12 lopen")
    end

    local function on_attach(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Disable formatting for some servers
      if client.server_capabilities.documentFormattingProvider then
        client.server_capabilities.documentFormattingProvider = false
      end
      if client.server_capabilities.documentRangeFormattingProvider then
        client.server_capabilities.documentRangeFormattingProvider = false
      end

      -- Common keymaps (go to definition, etc.)
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.keymap.set(
        "n",
        "<leader>rn",
        "<cmd>lua vim.lsp.buf.rename()<CR>",
        opts
      )
      vim.keymap.set(
        "n",
        "<leader>ca",
        "<cmd>lua vim.lsp.buf.code_action()<CR>",
        opts
      )
      vim.keymap.set(
        "n",
        "gi",
        "<cmd>lua vim.lsp.buf.implementation()<CR>",
        opts
      )
      vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    end

    -- Helper function to setup language servers
    local function setup_lsp(server, config)
      config = vim.tbl_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
      }, config or {})
      require("lspconfig")[server].setup(config)
    end

    -- Language server configurations
    setup_lsp("gopls", {
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
        },
      },
    })
    setup_lsp("clangd")
    setup_lsp("pylsp")
    setup_lsp("ts_ls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
    })
    setup_lsp("tailwindcss")
    setup_lsp("jsonls", {
      settings = {
        json = { schemas = require("schemastore").json.schemas() },
      },
    })
    setup_lsp("html")
    setup_lsp("cssls")
    setup_lsp("emmet_ls", {
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
    })
    setup_lsp("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "luajit" },
          workspace = {
            checkThirdParty = false,
            library = {
              "${3rd}/luv/library",
              unpack(vim.api.nvim_get_runtime_file("", true)),
            },
          },
        },
      },
    })
    setup_lsp("dockerls", {
      filetypes = { "dockerfile" },
    })
    setup_lsp("docker_compose_language_service", {
      filetypes = { "yaml.docker-compose" },
    })
    setup_lsp("eslint", {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Enable specific ESLint actions
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "<leader>ca",
          "<cmd>lua vim.lsp.buf.code_action()<CR>",
          { noremap = true, silent = true }
        )
      end,
      root_dir = function(fname)
        return util.root_pattern(
          -- Flat config (ESLint v9+)
          "eslint.config.js",
          "eslint.config.cjs",
          "eslint.config.mjs",
          "eslint.config.ts",
          -- Legacy config files
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.json",
          ".eslintrc.cjs",
          "eslint.config.js"
        )(fname)
      end,
    })
    setup_lsp("astro", {
      filetypes = { "astro" },
      root_dir = util.root_pattern(
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git"
      ),
    })
    setup_lsp("prismals", {
      settings = {
        prisma = {
          fileWatcher = true,
        },
      },
    })
    setup_lsp("stylelint_lsp", {
      settings = { stylelintplus = { autoFixOnFormat = false } },
      filetypes = { "css", "scss", "less" },
    })

    -- Global diagnostic keymaps - Using built-in location list
    vim.keymap.set(
      "n",
      "<leader>d",
      show_diagnostics_loclist,
      { desc = "Show diagnostics in location list" }
    )
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      float = { source = true },
    })

    -- Sign definitions
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
