{
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
        python.symbol = " ";
        package.symbol = " ";
        rust.symbol = " ";
        shell.disabled = false;
    };
}
