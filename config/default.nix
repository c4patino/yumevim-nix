{
  imports = [
    ./languages
    ./navigation
    ./ui
    ./utils

    ./autocmds.nix
    ./mappings.nix
    ./options.nix
  ];

  viAlias = true;
  vimAlias = true;

  clipboard.providers.wl-copy.enable = true;
}
