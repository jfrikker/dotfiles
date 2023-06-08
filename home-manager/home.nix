{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jfrikker";
  home.homeDirectory = "/Users/jfrikker";

  home.sessionVariables.TEST = "foo";
  home.sessionVariables.RUST_SRC_PATH = "${pkgs.rust-bin.stable."1.68.0".rust-src}/lib/rustlib/src/rust/library";
  home.sessionVariables.BAT_THEME = "catppuccin-macchiato";

  home.packages = [
    # pkgs.apacheKafka
    pkgs.aria
    pkgs.aws-iam-authenticator
    pkgs.awscli
    pkgs.bashInteractive
    # pkgs.emacs
    pkgs.fd
    pkgs.fend
    # pkgs.ghc
    # pkgs.go
    # pkgs.haskellPackages.cabal-install
    # pkgs.haskellPackages.haskell-language-server
    pkgs.httpie
    # pkgs.inconsolata-nerdfont
    pkgs.jdt-language-server
    pkgs.just
    pkgs.jsonnet
    pkgs.kubectl
    pkgs.maven
    pkgs.mysql-client
    # pkgs.neovide
    pkgs.neovim
    pkgs.nodejs-16_x
    pkgs.nodePackages.typescript-language-server
    pkgs.postgresql
    pkgs.ripgrep
    # pkgs.rlwrap
    # pkgs.rust-analyzer
    pkgs.rust-script
    pkgs.rust-bin.stable."1.68.0".default
    pkgs.rust-bin.stable."1.68.0".rust-analyzer
    # pkgs.rustup
    # pkgs.sbcl
    # pkgs.source-code-pro
    pkgs.tokei
    # pkgs.xonsh
    pkgs.yarn
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
  programs.bat = import ./home-bat.nix pkgs;
  programs.btop.enable = true;
  programs.exa = import ./home-exa.nix;
  programs.fish = import ./home-fish.nix pkgs;
  programs.fzf = import ./home-fzf.nix;
  # programs.gh.enable = true;
  programs.git.enable = true;
  programs.git.delta.enable = true;
  programs.java.enable = true;
  programs.java.package = pkgs.jdk17;
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.lazygit.enable = true;
  programs.starship = import ./home-starship.nix;
  programs.tmux = import ./home-tmux.nix;
  programs.zoxide.enable = true;

  # programs.neovim = import ./home-neovim.nix pkgs;
}
