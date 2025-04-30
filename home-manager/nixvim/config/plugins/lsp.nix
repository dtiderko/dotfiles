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
  };

  keymaps.lspBuf = {
    "gd" = "definition";
    "gD" = "references";
    "gs" = "signature_help";
    "gi" = "implementation";
    "gt" = "type_definition";
    "K" = "hover";
    "<space>rn" = "rename";
    "<space>a" = "code_action";
    "<space>fm" = "format";
  };
}
