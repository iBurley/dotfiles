{ pkgs, ... }:

{

  home.file.".config/nvim/" = {
    source = ../files/nvim;
    recursive = true;
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
      lualine-nvim
      neo-tree-nvim
      nvim-autopairs
      nvim-colorizer-lua
      nvim-treesitter.withAllGrammars
      render-markdown-nvim
      vague-nvim
    ];
  };

  xdg.desktopEntries.nvim = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
