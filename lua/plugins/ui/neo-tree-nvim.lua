local icons = require("configs.ui").icons

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neotree",
  lazy = false,
  opts = {
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy", "dap-repl", "dap-view", "dap-view-term", "neotest-summary" },
    filesystem = {
      hijack_netrw_behavior = "open_default",
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_ignored = false,
      }
    },
    default_component_configs = {
      diagnostics = {
        symbols = {
          hint = icons.Hint,
          info = icons.Info,
          warn = icons.Warn,
          error = icons.Error,
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree focus<cr>",
      desc = "NeoTree focus window"
    },
  }
}
