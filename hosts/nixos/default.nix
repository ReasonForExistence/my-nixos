{ config, pkgs, ... }:

{
  imports = [
    ../../modules/desktop/system-i3.nix
    ../../modules/development
    ../../modules/system/boot.nix
    ../../modules/system/diagnostics.nix
    ../../modules/system/networking.nix
    ../../modules/system/nix-ld.nix
    ../../modules/system/sound.nix
    ../../modules/system/user.nix
    ../../modules/system/graphics.nix
    ../../modules/system/flatpak.nix
    ../../modules/system/storage.nix
    ./hardware-configuration.nix
  ];

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  services.printing.enable = true;
  programs.dconf.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
