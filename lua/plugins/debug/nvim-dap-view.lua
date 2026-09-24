return {
  "igorlfs/nvim-dap-view",
  version = "1.*",
  cmd = { "DapViewOpen", "DapViewClose", "DapViewToggle" },
  keys = {
    {
      "<leader>dt",
      "<cmd>DapViewToggle<cr>",
      mode = "n",
      desc = "DAP Toggle UI"
    }
  },
  opts = {
    winbar = {
      default_section = "repl",
      controls = {
        enabled = true
      }
    }
  }
}
