{
  description = "Harshit's system configuration.";

  # Where do we get our packages:
  inputs = {
    # Main NixOS monorepo. We follow the rolling release.
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-master.url = "nixpkgs/master";
    rust-overlay.url = "github:oxalica/rust-overlay";
    neovim-nightly-overlay.url  = "github:nix-community/neovim-nightly-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = inputs@{
    self
    , nixpkgs
    , nixpkgs-master
    , home-manager
    , ...
  }: let
    inherit (lib.my) mapModules mapModulesRec mapHosts;

    system = "x86_64-linux";

    mkPkgs = pkgs: extraOverlays: import pkgs {
      inherit system;
      config.allowUnfree = true;  # forgive me Stallman senpai
      overlays = extraOverlays;
    };
    pkgs = mkPkgs nixpkgs [];
    master = mkPkgs nixpkgs-master [];

    lib = nixpkgs.lib.extend
      (self: super: { my = import ./lib { inherit pkgs inputs; lib = self; }; });

    # Home manager setup. We also import doom-emacs to be in the scope. See
    # `home.nix` for more.
    home = [
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.harshit = lib.mkMerge [
          ./home.nix
        ];
      }
    ];

    common = { pkgs, config, ... }: {
      config = {
        nix = {
          # add binary caches
          binaryCachePublicKeys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
          binaryCaches = [
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
          ];
        };

        nixpkgs.overlays = [
          (self: super: {
            master = master;
            my = self.packages."${system}";
            nvidia_x11 = self.linuxPackages_5_12.nvidia_x11;
          })
          inputs.rust-overlay.overlay
          inputs.neovim-nightly-overlay.overlay
        ];
      };
    };
  in {
    packages."${system}" =
      mapModules ./packages (p: pkgs.callPackage p {});

    nixosConfigurations = {

      # Lenovo Y540
      ylaptop = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./hosts/ylaptop.nix
          common
        ] ++ home;
        specialArgs = {
          inherit inputs;
          inherit home-manager;
        };
      };
    };
  };
}
