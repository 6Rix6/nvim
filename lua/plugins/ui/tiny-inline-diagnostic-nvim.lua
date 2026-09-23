local icons = require("configs.ui").icons

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  init = function()
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = false,
    })
  end,
  opts = {
    preset = "ghost",
    signs = {
      diag = icons.Error,
    },
    options = {
      add_messages = {
        display_count = true,
      },
      multilines = {
        enabled = true,
      },
    },
  }
}
