{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.ui.indent-blankline";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "indent-blankline";
  };

  config = mkIf cfg.enable {
    plugins.indent-blankline = {
      enable = true;
      settings.scope.enabled = false;
    };
  };
}
