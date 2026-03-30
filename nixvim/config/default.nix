{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./style.nix
    ./lsp.nix

    # plugins
    ./git.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  enable = true;
  viAlias = true;

	clipboard = {
		register = "unnamedplus";
    providers.wl-copy.enable = true;
	};

  performance = {
    combinePlugins.enable = true;
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
      excludedPlugins = [];
    };
  };
}
