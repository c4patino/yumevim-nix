{pkgs, ...}: {
  imports = [
    ./alpha.nix
    ./fidget.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./noice.nix
    ./nvim-notify.nix
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
