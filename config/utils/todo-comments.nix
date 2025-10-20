{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.utils.todo-comments";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "todo-comments";
  };

  config = mkIf cfg.enable {
    keymaps = [
      {
        mode = "n";
        key = "<leader>tc";
        action = "<cmd>TodoTelescope<cr>";
        options.desc = "Telescope Find todo comments";
      }
    ];

    plugins = {
      todo-comments.enable = true;
    };
  };
}
