# nixos-xivlauncher-rb

[XIVLauncher-RB](https://github.com/rankynbass/XIVLauncher.Core) for NixOS.

## Installation

Firstly your system must have Flakes enabled. To do this, add the following to your `configuration.nix` file:
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Then run `sudo nixos-rebuilt test`, then create a `flake.nix` file in your NixOS configuration directory with the following content:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # This should match the version of NixOS you want to use

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

Alternatively, with optional [GameMode](https://github.com/FeralInteractive/gamemode) support:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; # This should match the version of NixOS you want to use

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

Now run `sudo nix flake update` in your NixOS configuration directory and rebuild your system as normal. Please note that the previous method of updating Nix channels will no longer work, you will have to use `sudo nix flake update` as long as Flakes are enabled.

## Credits

* [nur-packages-template](https://github.com/nix-community/nur-packages-template) for providing the template for a Nix Flake
* [sersorrel](https://github.com/sersorrel) and [witchof0x20](https://github.com/witchof0x20) for maintaining the [XIVLauncher package in Nixpkgs](https://github.com/NixOS/nixpkgs/tree/master/pkgs/by-name/xi/xivlauncher) which this heavily borrows from
