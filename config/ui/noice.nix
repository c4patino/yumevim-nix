{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.ui.noice";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "noice";
  };

  config = mkIf cfg.enable {
    plugins.noice = {
      enable = true;

      settings = {
        notify.enabled = false;
        messages.enabled = true;

        lsp = {
          message.enabled = true;
          progress = {
            enabled = false;
            view = "mini";
          };
        };

        popupmenu = {
          enabled = true;
          backend = "nui";
        };
        format = {
          filter = {
            pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
            icon = "";
            lang = "regex";
          };
          replace = {
            pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
            icon = "󱞪";
            lang = "regex";
          };
        };
      };
    };
  };
}
