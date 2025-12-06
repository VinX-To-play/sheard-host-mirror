{ config, lib, ... }:

with lib;

let
  cfg = config.services.sheardHosts;  # consistent name

in {
  options.services.sheardHosts = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable sheardHosts module.";
    };
  };

  config = mkIf cfg.enable {
    networking.hosts = {
    "100.64.0.11" = [
      "komga.slave.int"
      "vaultwarden.slave.int"
      "slave.int"
      "ca.slave.int"
    ];
    "100.64.0.17" = [
      "gitea.yggdrasil.com"
      "qdrant.yggdrasil.com"
      "firefly.yggdrasil.com"
      "importer.yggdrasil.com"
      "actual.yggdrasil.com"
      "nextcloud.yggdrasil.com"
    ]; 
    };
  };
}
