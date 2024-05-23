{
    enable = true;
    defaultCommand = "fd --type f";
    fileWidgetCommand = "fd --type f";
    fileWidgetOptions = ["--preview" "'bat --color=always --style=numbers --line-range=:500 {}'"];
    changeDirWidgetCommand = "fd --type d";
    tmux.enableShellIntegration = true;
}
