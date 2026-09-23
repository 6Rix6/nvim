return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  event = {
    "BufNewFile", "BufReadPre"
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
