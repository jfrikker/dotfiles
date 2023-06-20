pkgs:
    {
        enable = true;
        extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
        config = {
            theme = "catppuccin-frappe";
        };
        themes = {
          catppuccin-frappe = builtins.readFile (pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "sublime-text"; # Bat uses sublime syntax for its themes
            rev = "3d8625d937d89869476e94bc100192aa220ce44a";
            sha256 = "3ABUsfJpb6RO6AiuuSL5gwDofJIwC5tlEMzBrlY9/s0=";
          } + "/Frappe.tmTheme");
        };
    }
