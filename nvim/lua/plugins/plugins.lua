return {
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  -- {
  --   "stevearc/dressing.nvim",
  -- },
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
    "windwp/nvim-spectre",
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
}
