{
  enable = true;

  servers = {
    nixd.enable = true;
    bashls.enable = true;
    zls.enable = true;
    pyright.enable = true;

    rust_analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
      installRustfmt = false;
    };

    # c
    cmake.enable = true;
    clangd.enable = true;

    # web
    html.enable = true;
    htmx.enable = true;

    # config
    taplo.enable = true; # toml
    jsonls.enable = true;

    # haskell
    hls = {
      enable = true;
      installGhc = false;
    };
  };

  keymaps = {
    diagnostic = {
      "<leader>j" = "goto_next";
      "<leader>k" = "goto_prev";
    };
    lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "gs" = "signature_help";
      "gi" = "implementation";
      "gt" = "type_definition";
      "K" = "hover";
      "<leader>rn" = "rename";
      "<leader>a" = "code_action";
      "<leader>fm" = "format";
    };
  };
}
