{ self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      checks.modmail-module = pkgs.nixosTest (
        import ./modmail-module.nix { module = self.nixosModules.modmail-with-overlay; }
      );
    };
}
