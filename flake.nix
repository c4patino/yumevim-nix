{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixvim.url = "github:nix-community/nixvim";

    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    treefmt-nix,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        namespace = "yumevim";

        treefmtConfig = {...}: {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
          };
        };
        treefmtEval = treefmt-nix.lib.evalModule pkgs (treefmtConfig {inherit pkgs;});

        pkgs = import nixpkgs {inherit system;};
        mergedLib = pkgs.lib.extend (final: prev: {${namespace} = import ./lib {lib = pkgs.lib;};});

        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        mkNixvimProfile = custom: {
          module = {
            imports = [./config];

            ${namespace} = pkgs.lib.mkMerge [
              {
                bundles.common.enable = true;
              }
              custom
            ];
          };

          extraSpecialArgs = {
            inherit namespace pkgs;
            lib = mergedLib.extend nixvim.lib.overlay;
          };
        };

        minimal = mkNixvimProfile {};

        full = mkNixvimProfile {
          languages = {
            lsp.enable = true;
          };
          utils = {
            obsidian.enable = true;
          };
        };
      in {
        checks = {
          treefmt = treefmtEval.config.build.check self;
          minimal = nixvimLib.check.mkTestDerivationFromNixvimModule minimal;
        };

        packages = {
          default = nixvim'.makeNixvimWithModule minimal;
          full = nixvim'.makeNixvimWithModule full;
        };
      }
    );
}
