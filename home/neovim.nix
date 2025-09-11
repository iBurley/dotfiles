{ pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraLuaConfig = ''
      -- map leader
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      -- basic settings
      vim.opt.cursorline = true
      vim.opt.expandtab = true
      vim.opt.ignorecase = true
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.scrolloff = 10
      vim.opt.shiftwidth = 2
      vim.opt.showmode = false
      vim.opt.smartcase = true
      vim.opt.smartindent = true
      vim.opt.softtabstop = 2
      vim.opt.tabstop = 2
      vim.opt.undofile = true
      vim.opt.wrap = false

      -- window nav
      vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
      vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
      vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
      vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

      -- window split
      vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
      vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })

      -- auto pairs
      require('nvim-autopairs').setup()

      -- colorscheme
      require("kanagawa").load("wave")

      -- git signs
      require('gitsigns').setup()

      -- statusline
      require('lualine').setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_b = {
            {'branch', icon = ""},
            {'diff'},
          },
          lualine_c = {
            {'filename'},
            {'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' '}},
          },
          lualine_x = {
            {'filetype', icon = ""},
          },
        },
      })

      -- tree
      require('neo-tree').setup()

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          require("neo-tree.command").execute({ action = "show" })
        end
      })

      -- lsp config
      vim.lsp.config.nixd = {
        cmd = { 'nixd' },
        filetypes = { 'nix' },
        single_file_support = true,
        capabilities = capabilities,
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> { }",
            },
            formatting = {
              command = { "nixfmt" },
            },
          },
        },
      }
      vim.lsp.enable('nixd')

      -- lsp diagnostic signs
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = ""
          }
        }
      })

      -- completion
      vim.o.completeopt = 'menuone,noselect'

      vim.api.nvim_create_autocmd('InsertEnter', {
        callback = function()
          vim.lsp.completion.enable(true, vim.lsp.get_active_clients()[1].id, 0, { autotrigger = true })
        end
      })

      -- format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.nix",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- treesitter
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    '';

    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

    plugins = with pkgs.vimPlugins; [
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
