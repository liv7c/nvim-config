-- language server protocol

return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
  },
  config = function()
    -- setup mason to automatically install lsp servers
    require('mason').setup({
      ui = {
        height = 0.8,
      },
    })
    require('mason-lspconfig').setup({ automatic_installation = true })

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- php
    -- require('lspconfig').intelephense.setup({
    --   commands = {
    --     intelephenseindex = {
    --       function()
    --         vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
    --       end,
    --     },
    --   },
    --   on_attach = function(client, bufnr)
    --     -- client.server_capabilities.documentformattingprovider = false
    --     -- client.server_capabilities.documentrangeformattingprovider = false
    --     -- if client.server_capabilities.inlayhintprovider then
    --     --   vim.lsp.buf.inlay_hint(bufnr, true)
    --     -- end
    --   end,
    --   capabilities = capabilities
    -- })

    require('lspconfig').phpactor.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.completionprovider = false
        client.server_capabilities.hoverprovider = false
        client.server_capabilities.implementationprovider = false
        client.server_capabilities.referencesprovider = false
        client.server_capabilities.renameprovider = false
        client.server_capabilities.selectionrangeprovider = false
        client.server_capabilities.signaturehelpprovider = false
        client.server_capabilities.typedefinitionprovider = false
        client.server_capabilities.workspacesymbolprovider = false
        client.server_capabilities.definitionprovider = false
        client.server_capabilities.documenthighlightprovider = false
        client.server_capabilities.documentsymbolprovider = false
        client.server_capabilities.documentformattingprovider = false
        client.server_capabilities.documentrangeformattingprovider = false
      end,
      init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
      },
      handlers = {
        ['textdocument/publishdiagnostics'] = function() end
      }
    })

    -- vue, javascript, typescript
    require('lspconfig').volar.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentformattingprovider = false
        client.server_capabilities.documentrangeformattingprovider = false
      end,
      capabilities = capabilities,
    })

    require('lspconfig').ts_ls.setup({
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
            languages = {"javascript", "typescript", "vue"},
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      },
    })

    -- tailwind css
    require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

    -- json
    require('lspconfig').jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          -- add some extra intellisense when inside a json config file
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    -- html
    require('lspconfig').html.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })
    
    -- css
    require('lspconfig').cssls.setup({
      capabilities = capabilities,
    })

    -- configure emmet language server
    require('lspconfig').emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "atro",
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


    -- lua
    require('lspconfig').lua_ls.setup({
      settings = {
        lua = {
          runtime = { version = 'luajit' },
          workspace = {
            checkthirdparty = false,
            library = {
              '${3rd}/luv/library',
              unpack(vim.api.nvim_get_runtime_file('', true)),
            },
          }
        }
      }
    })

    -- configure eslint lsp
    require('lspconfig').eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- enable code actions
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
      end,
    })

    -- keymaps
    vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', 'gd', ':telescope lsp_definitions<cr>')
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set('n', 'gi', ':telescope lsp_implementations<cr>')
    vim.keymap.set('n', 'gr', ':telescope lsp_references<cr>')
    vim.keymap.set('n', '<leader>lr', ':lsprestart<cr>', { silent = true })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })

    -- diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      }
    })

    -- sign configuration
    vim.fn.sign_define('diagnosticsignerror', { text = '', texthl = 'diagnosticsignerror' })
    vim.fn.sign_define('diagnosticsignwarn', { text = '', texthl = 'diagnosticsignwarn' })
    vim.fn.sign_define('diagnosticsigninfo', { text = '', texthl = 'diagnosticsigninfo' })
    vim.fn.sign_define('diagnosticsignhint', { text = '', texthl = 'diagnosticsignhint' })
  end,
}
