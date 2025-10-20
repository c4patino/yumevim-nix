{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.utils.toggleterm";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "toggleterm";
  };

  config = mkIf cfg.enable {
    plugins.toggleterm = {
      enable = true;

      settings = {
        open_mapping = "[[<A-i>]]";

        direction = "float";

        float_opts.border = "curved";
        winbar.enabled = true;
      };
    };
  };
}
