{ config, lib, ...}:
  with lib;
  let
    cfg = config.services.hostManager;
  in {
  options.services.hostManager = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    config = mkIf cfg.enable {
      networking.host = {
        "100.64.0.17" = [
          "gitea.yggdrasil.com"
          "qdrant.yggdrasil.com"
          "firefly.yggdrasil.com"
          "importer.yggdrasil.com"
          "actual.yggdrasil.com"
          "nextcloud.yggdrasil.com"
        ];
        "100.64.0.11" = [
          "komga.slave.int"
          "vaultwarden.slave.int"
          "slave.int"
          "ca.slave.int"
        ];
      };
    };
  };
}
