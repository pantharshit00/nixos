{ config, lib, pkgs, nixpkgs, home-manager, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ansible
    neovim-nightly
    vscode
    git
    gdb
    perl
    clang
    binutils
    zlib
    ripgrep
    fd
    openjdk
    jq
    nodejs-slim
    nodePackages.npm
    starship
    docker-compose
    python3
    rust-analyzer
    rust-bin.stable.latest.default
    cargo-watch
    cargo-bloat
    mysql-client
    postgresql_12
    gnumake
    evcxr
  ];
}
