return {
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "stevearc/dressing.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "SmiteshP/nvim-navic",
    enabled = false,
  },
  {
    "folke/trouble.nvim",
    enabled = false,
  },
  -- {
  --   "folke/todo-comments.nvim",
  --   enabled = false,
  -- },
  {
    "nvim-pack/nvim-spectre",
    enabled = false,
  },
  {
    "persistence.nvim",
    enabled = false,
  },
  -- {
  --   "ggandor/leap-spooky.nvim",
  --   enabled = true,
  --   opts = {
  --       paste_on_remote_yank = true,
  --   },
  -- },
  -- {
  --   "ggandor/flit.nvim",
  --   enabled = false,
  -- },
  -- {
  --   "rafamadriz/friendly-snippets",
  --   enabled = false,
  -- },
  {
    "folke/noice.nvim",
    enabled = false,
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      }
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  -- { "ellisonleao/gruvbox.nvim" },
  -- {"rktjmp/lush.nvim" },
  -- {"briones-gabriel/darcula-solid.nvim",
  --   depends = {"rktjmp/lush.nvim" },
  -- },
  -- { "doums/darcula" },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      })
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    depends = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    main = "treesitter-context",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(opts)
      local actions = require("telescope.actions")
      opts.defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
        path_display = { "shorten" },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
        },
      }
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "sql" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        integrations = {
            alpha = false,
            navic = false,
            lsp_trouble = false,
            trouble = false,
        }
    }
  },
    {
    "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({
            show_quickfixes_cmd = "cope",
            edit_with_instructions = {
                keymaps = {
                    use_output_as_input = "<C-r>",
                },
            },
        })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
    },
}
