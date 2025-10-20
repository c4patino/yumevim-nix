{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.utils.zenmode";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "zenmode";
  };

  config = mkIf cfg.enable {
    keymaps = [
      {
        mode = "n";
        key = "<leader>zz";
        action = "<cmd>ZenMode<cr>";
      }
    ];

    plugins.zen-mode = {
      enable = true;
      settings.window.width = 150;
    };
  };
}
