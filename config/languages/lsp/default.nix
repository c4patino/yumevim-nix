{
  config,
  lib,
  namespace,
  pkgs,
  ...
} @ inputs: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.languages.lsp";
  cfg = getAttrByNamespace config base;
in {
  imports = [
    (import ./lspkind.nix inputs)
    (import ./lspsaga.nix inputs)
  ];

  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "lsp";
  };

  config = mkIf cfg.enable {
    plugins = {
      lsp = {
        enable = true;
        capabilities = "offsetEncoding = 'utf-16'";
        servers = {
          astro.enable = true;
          clangd.enable = true;
          csharp_ls.enable = true;
          gopls.enable = true;
          hls = {
            enable = true;
            installGhc = false;
          };
          jdtls = {
            enable = true;
            settings = {
              java.configuration.runtimes = [
                {
                  name = "JavaSE-25";
                  path = pkgs.openjdk25;
                }
                {
                  name = "JavaSE-21";
                  path = pkgs.openjdk21;
                }
                {
                  name = "JavaSE-8";
                  path = pkgs.openjdk8;
                }
              ];
            };
          };
          lua_ls.enable = true;
          nixd.enable = true;
          pylsp = {
            enable = true;
            settings.configurationSources = "pycodestyle";
            settings = {
              plugins = {
                pyflakes.enabled = true;
                mccabe.enabled = true;
                pycodestyle.enabled = true;
                pydocstyle.enabled = true;
                yapf.enabled = true;
              };
            };
          };
          sqls.enable = true;
          zls.enable = true;
        };
      };
      rustaceanvim.enable = true;
      typescript-tools.enable = true;
    };

    extraConfigLua = ''
      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
              border = _border;
          }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help, {
              border = _border;
          }
      )

      vim.diagnostic.config {
          float = { border=_border };
          virtual_text = true;
      };

      require('lspconfig.ui.windows').default_options = {
          border = _border;
      }
    '';
  };
}
