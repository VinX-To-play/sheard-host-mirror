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

    extraHosts = mkOption {
      type = types.attrsOf (types.listOf types.str);
      default = { };
      description = ''
        Map of IP -> list of hostnames to add to /etc/hosts.
        Example: { "10.0.0.5" = [ "myhost" "myhost.local" ]; }
      '';
    };
  };

  config = mkIf cfg.enable {
    networking.extraHosts = lib.concatMapAttrs (ip: names:
      builtins.concatStringsSep "\n" (map (n: "${ip} ${n}") names)
    ) cfg.extraHosts;
  };
}
