{pkgs, ...} @ inputs: {
  imports = [
    (import ./alpha.nix inputs)
    (import ./fidget.nix inputs)
    (import ./indent-blankline.nix inputs)
    (import ./lualine.nix inputs)
    (import ./noice.nix inputs)
    (import ./nvim-notify.nix inputs)
  ];

  colorschemes.tokyonight = {
    enable = true;
    settings.style = "night";
  };

  plugins = {
    colorizer.enable = true;
    dressing.enable = true;
    gitsigns.enable = true;
    numbertoggle.enable = true;

    web-devicons.customIcons = {
      hcl = {
        icon = "";
        color = "#5f43e9";
        cterm_color = "93";
        name = "HCL";
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    nui-nvim
  ];
}
