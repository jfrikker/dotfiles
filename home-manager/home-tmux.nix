{
    baseIndex = 1;
    clock24 = true;
    enable = true;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    shortcut = "Space";
    extraConfig = ''
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
    '';
}
