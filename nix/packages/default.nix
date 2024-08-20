{ inputs, self, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];
  perSystem =
    { config, pkgs, ... }:
    {
      packages = {
        default = config.packages.modmail;
        modmail = pkgs.python311.pkgs.callPackage ./modmail.nix { inherit self; };
      };
      overlayAttrs = {
        inherit (config.packages) modmail;
      };
    };
}
