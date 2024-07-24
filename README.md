# nixos-xivlauncher-rb

XIVLauncher-RB for NixOS.

## Installation

The following `flake.nix` can be used for installing XIVLauncher-RB:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nixos-xivlauncher-rb = {
      url = "github:drakon64/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-xivlauncher-rb }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [
          {
            environment.systemPackages = [
              nixos-xivlauncher-rb.packages.x86_64-linux.xivlauncher-rb
            ];
          }
          ./configuration.nix
        ];
      };
    };
  };
}
```

With optional GameMode support:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nixos-xivlauncher-rb = {
      url = "github:drakon64/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-xivlauncher-rb }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [
          {
            environment.systemPackages = [
              (nixos-xivlauncher-rb.packages.x86_64-linux.xivlauncher-rb.override {
                useGameMode = true;
              })
            ];
          }
          ./configuration.nix
        ];
      };
    };
  };
}
```

## Credits

* [nur-packages-template](https://github.com/nix-community/nur-packages-template) for providing the template for a Nix Flake
* [sersorrel](https://github.com/sersorrel) and [witchof0x20](https://github.com/witchof0x20) for maintaining the [XIVLauncher package in Nixpkgs](https://github.com/NixOS/nixpkgs/tree/nixos-unstable/pkgs/by-name/xi/xivlauncher) which this heavily borrows from
