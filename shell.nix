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
pkgs.mkShellNoCC {
  packages = [ pkgs.nixfmt-rfc-style ];
}
