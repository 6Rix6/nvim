return {
  "ysmb-wtsg/in-and-out.nvim",
  keys = {
    {
      "<A-CR>",
      function()
        require("in-and-out").in_and_out()
      end,
      mode = "i"
    },
  },
  opts = { additional_targets = { "“", "”" } },
}
