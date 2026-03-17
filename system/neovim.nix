{ pkgs, ... }:

let
  nvimConfig = builtins.path {
    path = ../files/nvim;
    name = "nvim-config";
  };
in
{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set runtimepath+=${nvimConfig}
        lua dofile("${nvimConfig}/init.lua")
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          fzf-lua
          gitsigns-nvim
          kanagawa-nvim
          lualine-nvim
          neo-tree-nvim
          nvim-autopairs
          nvim-colorizer-lua
          nvim-treesitter.withAllGrammars
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    bash-language-server
    lua-language-server
    nixd
    nixfmt-rfc-style
    shellcheck
    shfmt
    stylua
  ];

}
