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
        },
  },
  { "ellisonleao/gruvbox.nvim" },
  {"rktjmp/lush.nvim" },
  {"briones-gabriel/darcula-solid.nvim",
    depends = {"rktjmp/lush.nvim" },
  },
  { "doums/darcula" },
}
