{ pkgs, ... }:

{

  home.file = {
    ".config/nvim/init.lua".source = ../files/nvim/init.lua;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      bash-language-server
      lua-language-server
      nixd
      nixfmt-rfc-style
      shfmt
      stylua
    ];

    plugins = with pkgs.vimPlugins; [
      fzf-lua
      gitsigns-nvim
      kanagawa-nvim
      lualine-nvim
      neo-tree-nvim
      nvim-autopairs
      nvim-treesitter.withAllGrammars
    ];
  };

  xdg.desktopEntries.nvim = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
