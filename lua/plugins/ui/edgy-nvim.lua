return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-n>",
      function()
        require("edgy").toggle("left")
      end,
      desc = "Edgy toggle left edgebar",
      mode = { "n" }
    }
  },
  opts = {
    animate = {
      enabled = false,
    },
    close_when_all_hidden = true,
    left = {
      {
        title = "Explorer",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.6 },
        pinned = true,
        collapsed = false,
        open = "Neotree position=left",
      },
    },
    right = {
      {
        title = "Tests Summary",
        ft = "neotest-summary",
        pinned = false
      },
      {
        -- title = function()
        --   local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
        --   return vim.fn.fnamemodify(buf_name, ":t")
        -- end,
        title = "Symbols",
        ft = "trouble",
        pinned = true,
        open = "Trouble symbols toggle focus=false",
        filter = function(_, win)
          local trouble = vim.w[win].trouble

          if trouble and trouble.mode == "symbols" then
            return true
          end

          return false
        end,
      },
      {
        title = "Lsp",
        ft = "trouble",
        pinned = true,
        open = "Trouble lsp toggle focus=false",
        filter = function(_, win)
          local trouble = vim.w[win].trouble

          if trouble and trouble.mode == "lsp" then
            return true
          end

          return false
        end,
      },
    },
    bottom = {
      {
        title = "Terminal",
        ft = "toggleterm",
        size = { height = 0.3 },
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "trouble",
        title = "Diagnostics",
        size = { height = 0.3 },
        filter = function(_, win)
          local trouble = vim.w[win].trouble

          if trouble and trouble.mode == "diagnostics" then
            return true
          end

          return false
        end,
      },
      {
        ft = "trouble",
        title = "Quickfix",
        size = { height = 0.3 },
        filter = function(_, win)
          local trouble = vim.w[win].trouble

          if trouble and trouble.mode == "quickfix" then
            return true
          end

          return false
        end,
      },
      {
        ft = "trouble",
        title = "Quickfix List",
        size = { height = 0.3 },
        filter = function(_, win)
          local trouble = vim.w[win].trouble

          if trouble and trouble.mode == "qflist" then
            return true
          end

          return false
        end,
      },
      {
        ft = "trouble",
        title = "Loclist",
        size = { height = 0.3 },
        filter = function(_, win)
          local trouble = vim.w[win].trouble

          if trouble and trouble.mode == "loclist" then
            return true
          end

          return false
        end,
      },
      {
        ft = "dap-view",
        title = "DAP View",
        size = { height = 0.3 },
      },
      {
        ft = "dap-repl",
        title = "DAP REPL",
        size = { height = 0.3 },
      },
      {
        ft = "dap-view-term",
        title = "DAP Terminal",
        size = { height = 0.3 },
      }
    },
  }
}
