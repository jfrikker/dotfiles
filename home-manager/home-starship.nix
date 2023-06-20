pkgs: {
    enable = true;
    settings = {
        add_newline = false;
        git_branch.symbol = " ";
        git_status.ahead = "⇡\${count}";
        git_status.behind = "⇣\${count}";
        git_status.diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        git_status.format = "([\\[\$conflicted\$staged\$ahead_behind\\]](\$style) )";
        java.symbol = " ";
        line_break.disabled = true;
        nix_shell.symbol = " ";
        nodejs.symbol = " ";
        package.disabled = true;
        palette = "catppuccin_frappe";
        python.symbol = " ";
        package.symbol = " ";
        rust.symbol = " ";
        shell.disabled = false;
    } // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "3e3e54410c3189053f4da7a7043261361a1ed1bc"; # Replace with the latest commit hash
            sha256 = "soEBVlq3ULeiZFAdQYMRFuswIIhI9bclIU8WXjxd7oY=";
          } + /palettes/frappe.toml));
}
