{
  pkgs ? import <nixpkgs> { },
}:
{
  xivlauncher-rb = pkgs.callPackage ./xivlauncher-rb { };
}
