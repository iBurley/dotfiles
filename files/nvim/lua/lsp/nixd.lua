-- NIXD CONFIGURATION
vim.lsp.config.nixd = {
  cmd = { "nixd" },
  filetypes = { "nix" },
  single_file_support = true,
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = {
          expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options",
        },
        home_manager = {
          expr =
          "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options.home-manager.users.type.getSubOptions []",
        },
      },
    },
  },
}
vim.lsp.enable("nixd")

-- FORMAT ON SAVE
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format Nix files on save",
  pattern = "*.nix",
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
  end,
})
