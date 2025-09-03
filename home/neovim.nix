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

      -- colorscheme
      require("kanagawa").load("wave")

      -- git signs
      require('gitsigns').setup()

      -- statusline
      require('lualine').setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          icons_enabled = false,
        },
        sections = {
          lualine_x = {
            { 'filetype' }
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

      -- completion
      local cmp = require('cmp')
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

      -- LSP diagnostic signs
      local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

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

      -- autopairs
      require('nvim-autopairs').setup()

      -- telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    '';

    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

    plugins = with pkgs.vimPlugins; [
      cmp-nvim-lsp
      gitsigns-nvim
      kanagawa-nvim
      lualine-nvim
      neo-tree-nvim
      nvim-autopairs
      nvim-cmp
      nvim-treesitter.withAllGrammars
      telescope-file-browser-nvim
      telescope-nvim
    ];
  };

  xdg.desktopEntries.nvim = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
