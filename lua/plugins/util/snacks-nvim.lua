local uiconf = require("configs.ui")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = vim.tbl_deep_extend("force", { enabled = true }, uiconf.dashboard),
    rename = { enabled = true },
    bufdelete = { enabled = true },
    dim = { enabled = true, animate = { enabled = false } },
  },
  keys = {
    {
      "<leader>x",
      function()
        Snacks.bufdelete()
      end,
      desc = "Buffer close current"
    },
    {
      "<leader>sd",
      function()
        local dim = Snacks.dim

        if dim.enabled then
          dim.disable()
        else
          dim.enable()
        end
      end,
      desc = "Snacks toggle dim"
    },
  }
}
