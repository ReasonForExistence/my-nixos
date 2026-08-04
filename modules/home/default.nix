{
  config,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./appearance
    ./eww
    ./fish.nix
    ./i3
    ./kitty
    ./nvim.nix
    ./packages.nix
    ./picom
    ./rofi
    ./services
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
