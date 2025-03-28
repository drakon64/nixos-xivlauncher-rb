{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [
    (import ./overlay.nix)
  ];

  options.programs.xivlauncher.enable = lib.mkEnableOption "Enable XIVLauncher";

  config = lib.mkIf config.programs.xivlauncher.enable {
    environment.systemPackages = [
      pkgs.xivlauncher-rb.override
      {
        useGameMode = config.services.gamemode.enable;
        nvngxPath =
          if builtins.elem "nvidia" config.services.xserver.videoDrivers == true then
            "${config.hardware.nvidia.package}/lib/nvidia/wine"
          else
            "";
      }
    ];
  };
}
