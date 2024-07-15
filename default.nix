{ pkgs ? import <nixpkgs> { } }:

{
  xivlauncher-rb = pkgs.callPackage ./pkgs/xivlauncher-rb { };
}
