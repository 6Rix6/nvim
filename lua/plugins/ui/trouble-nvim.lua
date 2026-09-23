return {
  "folke/trouble.nvim",
  opts = {
    auto_close = false,
    warn_no_results = false,
    open_no_results = true,
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>cd",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble Diagnostics",
    },
    {
      "<leader>cD",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble Buffer Diagnostics",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Trouble Symbols",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Trouble LSP Definitions / references",
    },
    {
      "<leader>cL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble Location List",
    },
    {
      "<leader>cq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix List",
    },
  },
}
