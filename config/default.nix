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

  clipboard.providers.wl-copy.enable = true;
}
