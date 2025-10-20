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

        pkgs = import nixpkgs {inherit system;};
        mergedLib = pkgs.lib.extend (final: prev: {${namespace} = import ./lib {lib = pkgs.lib;};});

        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            lib = mergedLib.extend nixvim.lib.overlay;
            namespace = namespace;
          };
        };

        nvim = nixvim'.makeNixvimWithModule nixvimModule;

        treefmtConfig = {...}: {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
          };
        };
        treefmtEval = treefmt-nix.lib.evalModule pkgs (treefmtConfig {inherit pkgs;});
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          treefmt = treefmtEval.config.build.check self;
        };

        packages.default = nvim;
      }
    );
}
