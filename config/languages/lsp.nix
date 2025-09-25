{pkgs, ...}: {
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
          package = pkgs.haskell-language-server.override {supportedGhcVersions = ["98" "910"];};
        };
        jdtls.enable = true;
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
}
