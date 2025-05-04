{
  plugins = {
    lsp = {
      enable = true;
      capabilities = "offsetEncoding = 'utf-16'";
      servers = {
        clangd.enable = true;

        csharp-ls.enable = true;

        gopls.enable = true;

        java-language-server.enable = true;

        lua-ls.enable = true;

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

    rust-tools.enable = true;

    typescript-tools.enable = true;
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
            border = _border
        }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
            border = _border
        }
    )

    vim.diagnostic.config {
        float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
        border = _border
    }
  '';
}
