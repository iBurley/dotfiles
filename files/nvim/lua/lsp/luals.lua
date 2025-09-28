-- LUA_LS CONFIGURATION
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
vim.lsp.enable("lua_ls")

-- FORMAT ON SAVE
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format Lua files on save",
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 2000 })
  end,
})
