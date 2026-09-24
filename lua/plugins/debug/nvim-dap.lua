return {
  "mfussenegger/nvim-dap",
  cmd = { "DapNew", "DapContinue", "DapDisconnect", "DapTerminate" },
  keys = {
    {
      "<leader>db",
      "<cmd>DapToggleBreakpoint<cr>",
      mode = "n",
      desc = "DAP Toggle breakpoint"
    },
    {
      "<leader>dc",
      "<cmd>DapClearBreakpoints<cr>",
      mode = "n",
      desc = "DAP Clear all breakpoints"
    }
  }
}
