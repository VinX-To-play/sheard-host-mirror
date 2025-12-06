{ config, lib, ... }:

with lib;

let
  cfg = config.services.sheardHosts;  # consistent name

in {
  options.services.sheardHosts = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable sheardHosts module.";
    };
  };

  config = mkIf cfg.enable {
    networking.extraHosts = {
    "100.64.0.11" = [
      "komga.slave.int"
      "vaultwarden.slave.int"
      "slave.int"
      "ca.slave.int"
    ];
    
    };
  };
}
