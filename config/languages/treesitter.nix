{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.languages.treesitter";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "treesitter";
  };

  config = mkIf cfg.enable {
    plugins.treesitter = {
      enable = true;
      folding.enable = true;
      settings.highlight = {
        enable = true;
      };
    };
  };
}
