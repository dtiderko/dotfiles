{
  enable = true;
  settings = {
    completion.documentation = {
      auto_show = true;
      auto_show_delay_ms = 50;
    };
    # accept.auto_brackets.enabled = true;
    # trigger.signature_help.enabled = true;
    keymap = {
      preset = "default";
      "<C-e>" = [
        "hide"
      ];

      "<C-space>" = [
        "show"
        "show_documentation"
        "accept"
        "select_and_accept"
      ];

      "<C-n>" = [
        "snippet_forward"
        "fallback"
      ];
      "<C-p>" = [
        "snippet_backward"
        "fallback"
      ];

      "<Tab>" = [
        "select_next"
        "fallback"
      ];
      "<Down>" = [
        "select_next"
        "fallback"
      ];

      "<S-Tab>" = [
        "select_prev"
        "fallback"
      ];
      "<Up>" = [
        "select_prev"
        "fallback"
      ];
    };
  };
}
