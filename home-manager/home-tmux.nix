pkgs: {
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    historyLimit = 50000;
    enable = true;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    plugins = [
        {
            plugin = pkgs.tmuxPlugins.catppuccin;
            extraConfig = "set -g @catppuccin_window_tabs_enabled on";
        }
        {
            plugin = pkgs.tmuxPlugins.tmux-thumbs;
            extraConfig = ''
set -g @thumbs-unique enabled
            '';
        }
    ];
    shell = pkgs.fish + "/bin/fish";
    shortcut = "Space";
    tmuxinator.enable = true;
    extraConfig = ''
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

bind-key -T launcher g popup -h 100% -w 100% -E lazygit
bind-key g switch-client -Tlauncher
    '';
}
