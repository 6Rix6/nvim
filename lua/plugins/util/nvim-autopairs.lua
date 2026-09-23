return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup()

    local npairs = require("nvim-autopairs")
    local rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.add_rules({
      rule("<", ">")
          :with_pair(cond.before_regex("%w+"))
          :with_move(function(opts)
            return opts.char == ">"
          end)
    })
  end
}
