{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.utils.obsidian";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "obsidian";
  };

  config = mkIf cfg.enable {
    plugins = {
      obsidian = {
        enable = true;
        settings = {
          legacy_commands = false;

          workspaces = [
            {
              name = "obsidian";
              path = "~/Documents/obsidian";
            }
          ];
        };
      };
    };
  };
}
