require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "pyright",
  "lua_ls",
  "jsonls",
  "yamlls",
  "bashls",
  "rust_analyzer",
}
vim.lsp.enable(servers)
