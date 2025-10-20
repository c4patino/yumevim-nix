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
    dressing.enable = true;
    numbertoggle.enable = true;
    colorizer.enable = true;
    gitsigns.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    nui-nvim
  ];
}
