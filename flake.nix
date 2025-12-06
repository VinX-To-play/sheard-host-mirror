{
    discription = "flake used for the sheard Host file sharing";

    inputs = {};

    outputs = {self, ... }:
     let
       nixosModule = import ./nixos/module.nix;
     in {
       nixosModule.default = nixosModule;
    };
}
