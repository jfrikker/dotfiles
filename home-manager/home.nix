{ config, pkgs, ... }:

{
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "jfrikker";
    home.homeDirectory = "/Users/jfrikker";

    # home.sessionVariables.BAT_THEME = "catppuccin-frappe";
    home.sessionVariables.EDITOR = "nvim";
    home.sessionVariables.RUST_SRC_PATH = "${pkgs.rust-bin.stable."1.68.0".rust-src}/lib/rustlib/src/rust/library";

    xdg.enable = true;
    # xdg.configFile."k9s/skin.yml" = {
    #     enable = true;
    #     source = pkgs.fetchFromGitHub {
    #         owner = "catppuccin";
    #         repo = "k9s";
    #         rev = "322598e19a4270298b08dc2765f74795e23a1615"; # Replace with the latest commit hash
    #         sha256 = "GrRCOwCgM8BFhY8TzO3/WDTUnGtqkhvlDWE//ox2GxI=";
    #     } + /dist/frappe.yml;
    # };

    xdg.configFile."lazygit/config.yml" = {
        enable = true;
        source = pkgs.fetchFromGitHub
        {
            owner = "catppuccin";
            repo = "lazygit";
            rev = "b2ecb6d41b6f54a82104879573c538e8bdaeb0bf"; # Replace with the latest commit hash
            sha256 = "9BBmWRcjNaJE9T0RKVEJaSnkrbMom0CLYE8PzAT6yFw=";
        } + /themes/frappe.yml;
    };

    # xdg.configFile."fish/themes/Catppuccin Frappe.theme" = {
    #       enable = true;
    #       source = pkgs.fetchFromGitHub {
    #         owner = "catppuccin";
    #         repo = "fish";
    #         rev = "91e6d6721362be05a5c62e235ed8517d90c567c9";
    #         sha256 = "l9V7YMfJWhKDL65dNbxaddhaM6GJ0CFZ6z+4R6MJwBA=";
    #       } + "/themes/Catppuccin Frappe.theme";
    # };

    home.packages = [
        # pkgs.apacheKafka
        # pkgs.aria
        pkgs.aws-iam-authenticator
        pkgs.awscli
        pkgs.bashInteractive
        pkgs.du-dust
        # pkgs.emacs29
        pkgs.fd
        pkgs.fend
        pkgs.gh
        # pkgs.ghc
        # pkgs.go
        # pkgs.haskellPackages.cabal-install
        # pkgs.haskellPackages.haskell-language-server
        # pkgs.helix
        # pkgs.httpie
        # pkgs.inconsolata-nerdfont
        # pkgs.jdt-language-server
        pkgs.just
        # pkgs.jsonnet
        pkgs.kubectl
        pkgs.lorri
        # pkgs.maven
        pkgs.mysql-client
        # pkgs.neovide
        pkgs.neovim
        # pkgs.nodejs-16_x
        # pkgs.nodePackages.typescript-language-server
        # pkgs.postgresql
        # (pkgs.python3.withPackages (p: [p.ipython p.pyyaml p.boto3]))
        pkgs.ripgrep
        pkgs.rlwrap
        # pkgs.rust-analyzer
        pkgs.rust-script
        pkgs.rust-bin.stable."1.68.0".default
        pkgs.rust-bin.stable."1.68.0".rust-analyzer
        # pkgs.rustup
        pkgs.sbcl
        # pkgs.source-code-pro
        # pkgs.stack
        pkgs.tokei
        pkgs.xh
        # pkgs.xonsh
        # pkgs.yarn
        # pkgs.zellij
    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;


    programs.bash.enable = true;
    # programs.bat = import ./home-bat.nix pkgs;
    programs.btop.enable = true;
    programs.direnv.enable = true;
    programs.eza = import ./home-exa.nix;
    # programs.fish = import ./home-fish.nix pkgs;
    programs.fzf = import ./home-fzf.nix;
    # programs.gh.enable = true;
    programs.git.enable = true;
    programs.git.delta.enable = true;
    # programs.ion.enable = true;
    # programs.java.enable = true;
    # programs.java.package = pkgs.jdk17;
    programs.jq.enable = true;
    # programs.k9s.enable = true;
    programs.lazygit.enable = true;
    programs.starship = import ./home-starship.nix pkgs;
    programs.tmux = import ./home-tmux.nix pkgs;
    # programs.zoxide.enable = true;
    programs.zsh = import ./home-zsh.nix pkgs;

    # programs.neovim = import ./home-neovim.nix pkgs;
}
