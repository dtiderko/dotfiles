{
  enable = true;
  settings = {
    delete_to_trash = true;
    skip_confirm_for_simple_edits = true;

    keymaps = {
      "g?" = "actions.show_help";
      "<CR>" = "actions.select";
      "<Space>" = "actions.select";
      "q" = "actions.close";
      "<C-l>" = "actions.refresh";
      "-" = "actions.parent";
      "_" = "actions.open_cwd";
    };
    use_default_keymaps = false;

    view_options.show_hidden = true;

    float = {
      padding = 8;
      max_width = 128;
    };
  };
}
