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

        home.file.".config/nvim/" = {
          source = ../files/nvim;
          recursive = true;
        };

        programs.neovim = {
          enable = true;
          defaultEditor = true;
          viAlias = true;
          vimAlias = true;
          vimdiffAlias = true;
          withRuby = false; # # home.stateVersion less than 26.05
          withPython3 = false; # home.stateVersion less than 26.05

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
            nvim-treesitter.withAllGrammars
            render-markdown-nvim
            vague-nvim
          ];
        };

        xdg.desktopEntries.nvim = {
          name = "Neovim wrapper";
          noDisplay = true;
        };

      };

  };

}
