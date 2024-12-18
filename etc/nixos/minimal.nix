{ config, lib, ... }:

with lib;

{
  documentation.enable = mkDefault false;

  documentation.doc.enable = mkDefault false;

  documentation.info.enable = mkDefault false;

  documentation.man.enable = mkDefault false;

  documentation.nixos.enable = mkDefault false;

  # Perl is a default package.
  environment.defaultPackages = mkDefault [ ];

  environment.stub-ld.enable = mkDefault false;

  # The lessopen package pulls in Perl.
  programs.less.lessopen = mkDefault null;

  # This pulls in nixos-containers which depends on Perl.
  boot.enableContainers = mkDefault false;

  programs.command-not-found.enable = mkDefault false;

  services.logrotate.enable = mkDefault false;

  services.udisks2.enable = mkDefault false;

  xdg.autostart.enable = mkDefault false;
  xdg.icons.enable = mkDefault false;
  xdg.mime.enable = mkDefault false;
  xdg.sounds.enable = mkDefault false;

  # ChatGPT suggestions
  hardware.enableAllFirmware = false;   # Disable all firmware

  nixpkgs.config = {
    stripDebug = true;     # Strip debug symbols to save space
    dontStrip = false;     # Ensure non-debug binaries are stripped
    installLocale = false; # Do not install extra locales
  };

  nix.extraOptions = ''
    keep-outputs = false
    keep-derivations = false
  '';
}