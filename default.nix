{
  pkgs ?
    let
      lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    in
    (import (fetchTarball {
      url = "https://github.com/${lock.owner}/${lock.repo}/archives/refs/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    }) { }),
}:
{
  xivlauncher-rb = pkgs.callPackage ./xivlauncher-rb { };
}
