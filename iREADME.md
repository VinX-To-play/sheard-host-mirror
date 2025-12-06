# Shared-Intranet-Host

Used for uniting the Host files on our Intranet with is primary users run NixOS

# NIX
## Setup
In the flake.nix in your repo add:
```nix
inputs = {
    sheard-host.url = "git+ssh://gitea@gitea.yggdrasil.com/vinx/Shared-Intranet-Host.git?ref=main";
    }

outputs = inputs@{sheard-host}:
    nixosConfigurations = {
        host = nixpkgs.lib.nixosSystem {
            modules = [
                sheard-host.outputs.nixosModules.sheardHosts
            ]
        }
    }
```

## Options
Hosts and CA certs can be disabled by:
```nix
services.sheardHosts.enableHosts = false;
services.sheardHosts.enableCerts = false;
```
