{
    description = "sheard-host module";

    inputs = {};


outputs = { self, nixpkgs, ... }:
    let
      module = import ./nixos/module.nix;
    in {
      # NOTE: plural "nixosModules"
      nixosModules.sheardHosts = module;
    };
}
