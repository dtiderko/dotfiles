{ lib, ... }:
{
  # autocomplete
  plugins.blink-cmp = {
    enable = true;
    documentation.auto_show = true;
  };

  plugins.lspconfig.enable = true; # default configs
  plugins.lsp-format.enable = true; # formatter
  lsp = {
    servers = {
      basedpyright.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      cssls.enable = true;
      hls.enable = true;
      superhtml.enable = true;
      htmx.enable = true;
      jsonls.enable = true;
      nil_ls.enable = true;
      rust_analyzer.enable = true;
      ts_ls.enable = true;
      zls.enable = true;
    };
    keymaps = [
      # help
      {
        mode = "n";
        key = "K";
        lspBufAction = "hover";
      }
      {
        mode = "n";
        key = "gd";
        lspBufAction = "definition";
      }
      {
        mode = "n";
        key = "gD";
        lspBufAction = "declaration";
      }
      {
        mode = "n";
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        mode = "n";
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        mode = "n";
        key = "gr";
        lspBufAction = "references";
      }
      {
        mode = "n";
        key = "gs";
        lspBufAction = "signature_help";
      }

      # actions
      {
        mode = "n";
        key = "<leader>rn";
        lspBufAction = "rename";
      }
      {
        mode = "n";
        key = "<leader>a";
        lspBufAction = "code_action";
      }

      # errors
      {
        mode = "n";
        key = "gl";
        action = lib.nixvim.mkRaw "vim.diagnostic.open_float";
      }
    ];
  };
}
