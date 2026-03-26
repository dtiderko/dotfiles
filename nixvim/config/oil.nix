{ config, ... }: {
  performance.combinePlugins.standalonePlugins = [ config.plugins.oil.package ];

  keymaps = [{
    mode = "n";
    key = "<leader>pv";
    action = "<cmd>Oil<CR>";
  }];

  plugins.web-devicons.enable = true; # required by oil
  plugins.oil-git-status.enable = true;
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;

      view_options.show_hidden = true;

      use_default_keymaps = false;
      keymaps = {
        "g?" = "actions.show_help";
        "<CR>" = "actions.select";
        "<Space>" = "actions.select";
        "q" = "actions.close";
        "<C-l>" = "actions.refresh";
        "-" = "actions.parent";
        "_" = "actions.open_cwd";
      };
    };
  };
}
