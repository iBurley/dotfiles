{
  config,
  lib,
  ...
}:

{

  options.apps.neovim.enable = lib.mkEnableOption "Neovim";

  config = lib.mkIf config.apps.neovim.enable {

    home-manager.users.iburley =
      { pkgs, ... }:

      {

        programs.neovim = {
          enable = true;
          defaultEditor = true;
          viAlias = true;
          vimAlias = true;
          vimdiffAlias = true;

          extraPackages = with pkgs; [
            bash-language-server
            lua-language-server
            nixd
            nixfmt
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
            render-markdown-nvim
            vague-nvim
          ];
        };

        xdg.configFile.nvim.source = ../dotfiles/nvim;

        xdg.desktopEntries.nvim = {
          name = "Neovim wrapper";
          noDisplay = true;
        };

      };

  };

}
