return {
  -- disable default plugins
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  -- import plugins
  { import = "nvchad.blink.lazyspec" },
  { import = "plugins.common.nvim-tree" },
  { import = "plugins.common.conform-nvim" },
  { import = "plugins.common.neocodium" },
  { import = "plugins.common.nvim-lspconfig" },
  { import = "plugins.common.nvim-treesitter" },
  { import = "plugins.common.vimade" },
  { import = "plugins.common.lazygit-nvim" },
  { import = "plugins.common.hlchunk-nvim" },
  { import = "plugins.common.smear-cursor" },
  { import = "plugins.common.treesitter-context" },
  { import = "plugins.common.treesj" },

  -- import local plugins
  (function()
    local local_plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/local"
    if vim.fn.isdirectory(local_plugin_dir) == 1 then
      return { import = "plugins.local" }
    end
  end)(),
}
