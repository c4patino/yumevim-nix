{...} @ inputs: {
  imports = [
    (import ./bundles inputs)

    (import ./languages inputs)
    (import ./navigation inputs)
    (import ./ui inputs)
    (import ./utils inputs)

    ./autocmds.nix
    ./mappings.nix
    ./options.nix
  ];

  viAlias = true;
  vimAlias = true;

  clipboard.providers.wl-copy.enable = true;
}
