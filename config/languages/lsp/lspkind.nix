{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) getAttrByNamespace;
  cfg = getAttrByNamespace config "${namespace}.languages.lsp";
in {
  config = mkIf cfg.enable {
    plugins.lspkind = {
      enable = true;
      settings = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
