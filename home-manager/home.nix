{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jfrikker";
  home.homeDirectory = "/Users/jfrikker";

  home.packages = [
    # pkgs.apacheKafka
    pkgs.aws-iam-authenticator
    pkgs.awscli
    pkgs.bat
    pkgs.emacs
    pkgs.fd
    # pkgs.ghc
    # pkgs.go
    # pkgs.haskellPackages.cabal-install
    # pkgs.haskellPackages.haskell-language-server
    # pkgs.inconsolata-nerdfont
    pkgs.jdt-language-server
    pkgs.jsonnet
    pkgs.kubectl
    pkgs.maven
    pkgs.mysql-client
    pkgs.neovide
    pkgs.neovim
    pkgs.nodejs-16_x
    pkgs.nodePackages.typescript-language-server
    pkgs.postgresql
    pkgs.ripgrep
    # pkgs.rlwrap
    pkgs.rust-analyzer
    pkgs.rustup
    # pkgs.sbcl
    pkgs.source-code-pro
    pkgs.xonsh
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
  programs.bottom.enable = true;
  programs.fish = import ./home-fish.nix pkgs;
  programs.fzf.enable = true;
  programs.git.enable = true;
  programs.java.enable = true;
  programs.java.package = pkgs.jdk17;
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.lazygit.enable = true;
  programs.starship = import ./home-starship.nix;
  programs.tmux = import ./home-tmux.nix;

  # programs.neovim = import ./home-neovim.nix pkgs;
}
