{

    inputs = {};

    outputs = {self, ... }:
     let
       nixosModule = import ./nixos/module.nix;
     in {
       nixosModules.sheardHosts = nixosModule;
    };
}
