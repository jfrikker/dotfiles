return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  { "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "frappe",
            -- custom_highlights = function(colors)
            --     return {
            --         ["@type.qualifier"] = { link = "StorageClass" },
            --         ["@lsp.typemod.annotation"] = { link = "@attribute" },
            --         ["@lsp.type.interface"] = { link = "Structure" },
            --         ["@lsp.type.method"] = {},
            --         ["StorageClass"] = { fg = colors.mauve },
            --         ["@parameter"] = { fg = colors.text },
            --         ["@property"] = { fg = colors.maroon },
            --         ["@field"] = { fg = colors.maroon },
            --         ["Function"] = { fg = colors.text },
            --         ["Type"] = { fg = colors.text },
            --         ["Structure"] = { fg = colors.text },
            --         ["@method"] = { fg = colors.yellow },
            --     }
            -- end,
            custom_highlights = function(colors)
                return {
                    ["@type.qualifier"] = { link = "StorageClass" },
                    ["@parameter"] = { fg = colors.text },
                    ["@field"] = { fg = colors.maroon },
                    ["@lsp.type.interface"] = { link = "Structure" },
                    ["StorageClass"] = { fg = colors.mauve },
                }
            end,
        },
  },
  -- { "ellisonleao/gruvbox.nvim" },
  -- {"rktjmp/lush.nvim" },
  -- {"briones-gabriel/darcula-solid.nvim",
  --   depends = {"rktjmp/lush.nvim" },
  -- },
  -- { "doums/darcula" },
}
