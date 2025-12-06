{

    inputs = {};

    outputs = {self, ... }:
     let
       nixosModule = import ./nixos/module.nix;
     in {
       nixosModule.sheardHosts = nixosModule;
    };
}
