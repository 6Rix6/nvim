return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {
          { fg = "#34bfd0" },
          { fg = "#e36d76" },
        },
      },
      line_num = {
        enable = true
      },
      indent = {
        enable = false,
      },
      blank = {
        enable = false,
      },
    })
  end,
}
