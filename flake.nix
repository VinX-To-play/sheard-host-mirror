{

    inputs = {};

    outputs = {self, nixpkgs, ... }:
     let
     in {
       nixosModule.sheardHosts = import ./nixos/module.nix;
    };
}
