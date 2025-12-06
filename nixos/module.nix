{ config, lib, ... }:

with lib;

let
  cfg = config.services.sheardHosts;  # consistent name

in {
  options.services.sheardHosts = {
    enableHost = mkOption {
      type = types.bool;
      default = true;
      description = "enables Host module.";
    };
    enableCerts = mkOption {
      type = types.bool;
      default = true;
      description = "enable CA certs";
    };
  };

  config = {
    networking.hosts = lib.mkIf cfg.enableHost {
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
    "100.64.0.14" = [
      "ancient.portal"
      ]
  };

  security.pki.certificates = lib.mkIf cfg.enableCerts [
    (builtins.readFile ../cert/root_ca.crt)
  ];
  };
}
