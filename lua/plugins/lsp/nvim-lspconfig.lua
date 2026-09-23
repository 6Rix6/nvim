return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufNewFile", "BufReadPre" },
  init = function()
    local servers = {
      "lua_ls"
    }
    vim.lsp.enable(servers)
  end,
}
