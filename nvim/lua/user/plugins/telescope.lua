-- Fuzzy finder

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  keys = {
    {
      "<C-P>",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").lsp_references()
      end,
    },
    {
      "<leader>b",
      function()
        require("telescope.builtin").buffers()
      end,
    },
    {
      "<leader>sg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args({
          prompt_title = "Grep Project",
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "-L",
            "--color=never",
            "--sort=path",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        })
      end,
    },
    {
      "<leader>sG",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args({
          prompt_title = "Grep All Files",
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--no-ignore",
            "-L",
            "--color=never",
            "--sort=path",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        })
      end,
    },
    {
      "<leader>s",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
    },
    {
      "<leader>dd",
      function()
        require("telescope.builtin").diagnostics({ bufnr = 0 })
      end,
      desc = "Document Diagnostics (Telescope)",
    },
    {
      "<leader>dD",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Workspace Diagnostics (Telescope)",
    },
  },
  config = function()
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")

    require("telescope").setup({
      defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = "   ",
        selection_caret = "  ",
        layout_config = {
          prompt_position = "top",
        },
        preview = {
          filesize_limit = 1,
          timeout = 200,
          msg_bg_fillchar = " ",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
          },
        },
        file_ignore_patterns = { ".git/" },
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-space>"] = actions.to_fuzzy_refine,
              -- Toggle literal search mode (safe for symbols like {, *, etc.)
              ["<C-f>"] = lga_actions.quote_prompt({
                postfix = " --fixed-strings ",
              }),
            },
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        fzf = {
          fuzzy = true, -- enable fuzzy matching
          override_generic_sorter = true, -- better sorter for everything
          override_file_sorter = true,
          case_mode = "smart_case", -- or "ignore_case" / "respect_case"
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          previewer = false,
          layout_config = {
            width = 80,
          },
        },
        oldfiles = {
          prompt_title = "History",
        },
        lsp_references = {
          previewer = true,
        },
        lsp_definitions = {
          previewer = false,
        },
        lsp_document_symbols = {
          symbol_width = 55,
        },
      },
    })

    -- Load extensions safely
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "live_grep_args")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
