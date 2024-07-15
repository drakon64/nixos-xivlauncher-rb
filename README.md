# nixos-xivlauncher-rb

XIVLauncher-RB for NixOS.

```nix
{ config, pkgs, ... }:

let
  rb = import (pkgs.fetchFromGitHub {
    owner = "drakon64";
    repo = "nixos-xivlauncher-rb";
    rev = "11039ab07535a2cd4e525b301e5c20619de26050";
    hash = "sha256-vUZCidluStsh1xB7GiGYbvfHTpVxuDeYy5cGLCALfhQ=";
  }) { inherit pkgs; };
in {
  environment.systemPackages = [
    rb.xivlauncher-rb
  ];
}
```
