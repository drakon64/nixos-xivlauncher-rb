# nixos-xivlauncher-rb

XIVLauncher-RB for NixOS.

```nix
{ config, pkgs, ... }:

let
  rb = import (pkgs.fetchFromGitHub {
    owner = "drakon64";
    repo = "nixos-xivlauncher-rb";
    rev = "646b92f779395b7dddb42d0463c17be6e8596470";
    hash = "sha256-1AI4+VH8YrNCSVjAtHQjNwnC/inqDWKmFeXLeI5dLNw=";
  }) { inherit pkgs; };
in {
  environment.systemPackages = [
    rb.xivlauncher-rb
  ];
}
```
