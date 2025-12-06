{

    inputs = {};

    outputs = {self, nixpkgs, ... }:
     let
     in {
       nixosModules.sheardHosts = import ./nixos/module.nix;
    };
}
