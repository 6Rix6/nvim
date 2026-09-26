return {
  'akinsho/toggleterm.nvim',
  version = "*",
  cmd = { "ToggleTerm" },
  config = true,
  opts = {
    float_opts = {
      border = 'single',
      width = function(_)
        return math.ceil(math.min(vim.o.columns, math.max(80, vim.o.columns - 15)))
      end,
      height = function(_)
        return math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines - 5)))
      end,
    }
  },
  keys = {
    {
      "<A-h>",
      function()
        require("toggleterm").toggle(1, nil, nil, "horizontal")
      end,
      desc = "Toggle horizontal terminal",
      mode = { "n", "t" }
    },
    {
      "<A-i>",
      function()
        require("toggleterm").toggle(2, nil, nil, "float")
      end,
      desc = "Toggle floating terminal",
      mode = { "n", "t" }
    }
  }
}
