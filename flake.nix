{
  description = "Custom launcher for FFXIV";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      packages.${system} = rec {
        xivlauncher-rb = pkgs.callPackage ./pkgs/xivlauncher-rb { };
        default = xivlauncher-rb;
      };
    };
}
