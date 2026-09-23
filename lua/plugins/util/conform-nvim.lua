return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',   -- for format on save
  opts = {
    formatters_by_ft = { lua = { "stylua" } },
  },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      mode = { "n", "x" },
      desc = "General format file"
    }
  }
}
