{ pkgs, ... }:

{

  home.file = {
    ".config/nvim/init.lua".source = ../files/nvim/init.lua;
    ".config/nvim/lua/lsp/bashls.lua".source = ../files/nvim/lua/lsp/bashls.lua;
    ".config/nvim/lua/lsp/luals.lua".source = ../files/nvim/lua/lsp/luals.lua;
    ".config/nvim/lua/lsp/nixd.lua".source = ../files/nvim/lua/lsp/nixd.lua;
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
      shellcheck
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
