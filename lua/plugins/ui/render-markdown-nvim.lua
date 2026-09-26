return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = "markdown",
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    {
      "<leader>md",
      "<cmd>RenderMarkdown toggle<cr>",
      desc = "Toggle markdown rendering"
    }
  }
}
