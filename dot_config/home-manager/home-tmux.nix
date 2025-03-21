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
            extraConfig = ''set -g @catppuccin_window_tabs_enabled on
set -g @catppuccin_window_default_text "#W"
set -g @catppuccin_window_current_text "#W"'';
        }
#         {
#             plugin = pkgs.tmuxPlugins.tmux-thumbs;
#             extraConfig = ''
# set -g @thumbs-unique enabled
#             '';
#         }
    ];
    shell = pkgs.zsh + "/bin/zsh";
    shortcut = "Space";
    tmuxinator.enable = true;
    terminal = "xterm-256color";
    extraConfig = ''
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

bind-key -T launcher g popup -h 100% -w 100% -E lazygit
bind-key g switch-client -Tlauncher
set -g default-command ""
    '';
}
