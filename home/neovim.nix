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
      vim.keymap.set('i', '(', '()<Left>', { desc = 'Auto-close parentheses' })
      vim.keymap.set('i', '{', '{}<Left>', { desc = 'Auto-close braces' })
      vim.keymap.set('i', '[', '[]<Left>', { desc = 'Auto-close brackets' })
      vim.keymap.set('i', '"', '""<Left>', { desc = 'Auto-close double quotes' })
      vim.keymap.set('i', "'", "'''<Left>", { desc = 'Auto-close single quotes' })
      vim.keymap.set('i', '(;', '();<Left><Left>', { desc = 'Auto-close parentheses with semicolon' })
      vim.keymap.set('i', '{;', '{};<Left><Left>', { desc = 'Auto-close braces with semicolon' })
      vim.keymap.set('i', '[;', '[];<Left><Left>', { desc = 'Auto-close brackets with semicolon' })

      -- skip closing character if already present
      vim.keymap.set('i', ')', function()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local line = vim.api.nvim_get_current_line()
        local char = line:sub(col + 1, col + 1)
        if char == ')' then
          return '<Right>'
        else
          return ')'
        end
      end, { expr = true, desc = 'Skip or insert closing parenthesis' })

      vim.keymap.set('i', '}', function()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local line = vim.api.nvim_get_current_line()
        local char = line:sub(col + 1, col + 1)
        if char == '}' then
          return '<Right>'
        else
          return '}'
        end
      end, { expr = true, desc = 'Skip or insert closing brace' })

      vim.keymap.set('i', ']', function()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local line = vim.api.nvim_get_current_line()
        local char = line:sub(col + 1, col + 1)
        if char == ']' then
          return '<Right>'
        else
          return ']'
        end
      end, { expr = true, desc = 'Skip or insert closing bracket' })

      -- delete pairs together with backspace
      vim.keymap.set('i', '<BS>', function()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local line = vim.api.nvim_get_current_line()
        local prev_char = line:sub(col, col)
        local next_char = line:sub(col + 1, col + 1)

        local pairs = {
          ['('] = ')',
          ['{'] = '}',
          ['['] = ']',
          ['"'] = '"',
          ["'''"] = "'''"
        }

      if pairs[prev_char] and next_char == pairs[prev_char] then
          return '<BS><Del>'
        else
          return '<BS>'
        end
      end, { expr = true, desc = 'Delete matching pairs' })

      -- colorscheme
      require("kanagawa").load("wave")

      -- git signs
      require('gitsigns').setup()

      -- statusline
      require('lualine').setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" }
        },
        sections = {
          lualine_b = {
            { 'branch', icon = "" },
            { 'diff' },
            { 'diagnostics',
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' '
              }
            }
          },
          lualine_x = {
            { 'filetype', icon = "" }
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
      vim.o.completeopt = "menuone,noinsert,noselect"

      vim.keymap.set("i", "<C-Space>", function()
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes("<C-x><C-o>", true, true, true),
          "n"
        )
      end, { desc = "Trigger LSP completion" })

      vim.keymap.set("i", "j", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-n>"   -- move down
        else
          return "j"       -- insert literal j
        end
      end, { expr = true })

      vim.keymap.set("i", "k", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-p>"   -- move up
        else
          return "k"       -- insert literal k
        end
      end, { expr = true })

      vim.keymap.set("i", "<CR>", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-y>"   -- accept selected
        else
          return "<CR>"    -- normal Enter
        end
      end, { expr = true })

      vim.keymap.set("i", "<Esc>", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-e>"   -- cancel popup
        else
          return "<Esc>"
        end
      end, { expr = true })

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
      gitsigns-nvim
      kanagawa-nvim
      lualine-nvim
      neo-tree-nvim
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
