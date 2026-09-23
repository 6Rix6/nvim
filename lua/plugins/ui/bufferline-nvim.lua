local icons = require("configs.ui").icons

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = { "BufNewFile", "BufReadPre" },
  keys = {
    { "<tab>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Buffer next",         mode = "n" },
    { "<S-tab>",    "<cmd>BufferLineCyclePrev<cr>",   desc = "Buffer prev",         mode = "n" },
    { "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Buffer close others", mode = "n" },
  },
  init = function()
    vim.opt.termguicolors = true
  end,
  opts = {
    options = {
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, _, _)
        local icon =
            level:match("error") and icons.Error
            or level:match("warn") and icons.Warn
            or level:match("hint") and icons.Hint
            or icons.Info

        return " " .. icon .. count
      end
    }
  },
  config = function(_, opts)
    local Offset = require("bufferline.offset")
    if not Offset.edgy then
      local get = Offset.get
      Offset.get = function()
        if package.loaded.edgy then
          local layout = require("edgy.config").layout
          local ret = { left = "", left_size = 0, right = "", right_size = 0 }
          for _, pos in ipairs({ "left", "right" }) do
            local sb = layout[pos]
            if sb and #sb.wins > 0 then
              local title = string.rep(" ", sb.bounds.width)
              ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
              ret[pos .. "_size"] = sb.bounds.width
            end
          end
          ret.total_size = ret.left_size + ret.right_size
          if ret.total_size > 0 then
            return ret
          end
        end
        return get()
      end
      Offset.edgy = true
    end

    require("bufferline").setup(opts)
  end
}
