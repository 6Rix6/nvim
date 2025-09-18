require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "pyright",
  "lua_ls",
  "jsonls",
  "yamlls",
  "bashls",
  "rust_analyzer",
}
vim.lsp.enable(servers)

