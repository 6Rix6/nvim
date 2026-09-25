return {
  "lewis6991/satellite.nvim",
  dependencies = { "lewis6991/gitsigns.nvim" },
  event = { "BufNewFile", "BufReadPre" },
  opts = {
    excluded_filetypes = { "neo-tree", "terminal", "qf", "edgy", "dap-repl", "dap-view-term" },
  }
}
