return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require('telescope.builtin').find_files()
      end,
      desc = "Telescope find files",
      mode = "n"
    },
    {
      "<leader>fw",
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = "Telescope live grep",
      mode = "n"
    },
  },
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
    }
  },
}
