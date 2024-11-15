{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraLuaConfig = ''
      -- general
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
      vim.opt.tabstop = 2
      vim.opt.number = true
      vim.opt.cursorline = true
      vim.g.mapleader = " "
      vim.opt.showmode = false

      -- colorscheme
      require("kanagawa").load("wave")

      -- statusline
      require('lualine').setup {
        options = {
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right  = ""},
        }
      }

      -- treesitter
      local treesitter_path = vim.fn.expand("$HOME/.local/share/nvim/treesitter")
      vim.opt.runtimepath:append(treesitter_path)
      require('nvim-treesitter.configs').setup {
        parser_install_dir = treesitter_path,
        highlight = { enable = true },
        indent = { enable = true }
      }

      -- autopairs
      require('nvim-autopairs').setup()

      -- telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      -- telescope file browser
      vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    '';
    extraPackages = with pkgs; [
      gcc
      git
    ];
    plugins = with pkgs.vimPlugins; [
      kanagawa-nvim
      lualine-nvim
      nvim-autopairs
      nvim-treesitter.withAllGrammars
      telescope-file-browser-nvim
      telescope-nvim
    ];
  };

  xdg.desktopEntries."nvim" = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
