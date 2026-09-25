return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Gitsigns" },
  opts = {
    signs = {
      delete = { text = "󰍵" },
      changedelete = { text = "󱕖" },
    },
  },
  keys = {
    {
      "]c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          require("gitsigns").nav_hunk('next')
        end
      end,
      desc = "Git Junp next diff"
    },
    {
      "]c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          require("gitsigns").nav_hunk('prev')
        end
      end,
      desc = "Git Junp prev diff"
    },
    { "<leader>hQ", "<cmd>Gitsigns setqflist all<cr>", desc = "Git Add all diffs to quickfix" },
    { "<leader>hq", "<cmd>Gitsigns setqflist<cr>",     desc = "Git Add current file's diffs to quickfix" }
  }
}
