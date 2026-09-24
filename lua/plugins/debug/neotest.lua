return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
  },
  keys = {
    {
      "<leader>tn",
      function()
        require("neotest").run.run()
      end,
      mode = "n",
      desc = "Test Run nearest test",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.api.nvim_buf_get_name(0))
      end,
      mode = "n",
      desc = "Test Run current file tests",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      mode = "n",
      desc = "Test Toggle test summary sidebar",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({
          strategy = "dap",
        })
      end,
      mode = "n",
      desc = "Test Debug nearest test",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true })
      end,
      mode = "n",
      desc = "Test Open output"
    }
  },
  opts = {
    floating = {
      border = "rounded",
      max_height = 0.8,
      max_width = 0.8,
      options = {},
    },
  }
}
