{ config, lib, pkgs, nixpkgs, home-manager, ... }:

let
  fromNpm = import ./npm { inherit pkgs; };
  node = pkgs.nodejs-12_x;
  yarn = pkgs.yarn.override { nodejs = node; };
in {
  virtualisation = { docker.enable = true; };

  environment.systemPackages = with pkgs;
    with nodePackages;
    with fromNpm; [
      ansible
      neovim-nightly
      vscode
      git
      gdb
      perl
      clang
      binutils
      zlib
      shellcheck
      lua
      go
      luarocks
      ripgrep
      fd
      openjdk
      jq
      node
      deno
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

      typescript
      create-react-app
      pnpm
      yarn
      typescript-language-server
      fromNpm."@prisma/language-server"
      vscode-json-languageserver
      vscode-html-languageserver-bin
      graphql-language-service-cli
      emmet-ls
      prettier
      eslint
      vscode-css-languageserver-bin
      prisma
      bash-language-server
    ];
}
