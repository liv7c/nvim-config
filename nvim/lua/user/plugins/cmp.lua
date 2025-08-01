-- Completion

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-copilot",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim",
  },
  config = function()
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- require("luasnip/loaders/from_snipmate").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load()

    local source_map = {
      buffer = "Buffer",
      nvim_lsp = "LSP",
      luasnip = "LuaSnip",
      nvim_lsp_signature_help = "Signature",
      nvim_lua = "Lua",
      path = "Path",
      copilot = "Copilot",
    }

    local function ltrim(s)
      return s:match("^%s*(.*)")
    end

    cmp.setup({
      preselect = false,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      view = {
        entries = { name = "native" },
      },
      window = {
        completion = {
          col_offset = -2, -- align the abbr and word on cursor (due to fields order below)
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol",
          -- See: https://www.reddit.com/r/neovim/comments/103zetf/how_can_i_get_a_vscodelike_tailwind_css/
          before = function(entry, vim_item)
            -- Replace the 'menu' field with the kind and source
            vim_item.menu = "  "
              .. vim_item.kind
              .. " ("
              .. (source_map[entry.source.name] or entry.source.name)
              .. ")"
            vim_item.menu_hl_group = "SpecialComment"

            vim_item.abbr = ltrim(vim_item.abbr)

            if
              vim_item.kind == "Color" and entry.completion_item.documentation
            then
              local _, _, r, g, b = string.find(
                entry.completion_item.documentation,
                "^rgb%((%d+), (%d+), (%d+)"
              )
              if r then
                local color = string.format("%02x", r)
                  .. string.format("%02x", g)
                  .. string.format("%02x", b)
                local group = "Tw_" .. color
                if vim.fn.hlID(group) < 1 then
                  vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
                end
                vim_item.kind_hl_group = group
                return vim_item
              end
            end

            return vim_item
          end,
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif
            vim.fn.col(".") > 1
            and vim.fn
              .getline(".")
              :sub(vim.fn.col(".") - 1, vim.fn.col(".") - 1)
              :match("%s")
          then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "nvim_lsp_signature_help", priority = 900 },
        { name = "luasnip", priority = 750 },
        { name = "copilot", priority = 600 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
    })
  end,
}
