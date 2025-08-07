return {
  { import = "nvchad.blink.lazyspec" },
  { import = "plugins.common.nvim-tree" },
  { import = "plugins.common.conform-nvim" },
  { import = "plugins.common.neocodium" },
  { import = "plugins.common.nvim-lspconfig" },
  { import = "plugins.common.nvim-treesitter" },
  { import = "plugins.common.vimade" },
  { import = "plugins.common.lazygit-nvim" },
  (function()
    local local_plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/local"
    if vim.fn.isdirectory(local_plugin_dir) == 1 then
      return { import = "plugins.local" }
    end
  end)(),
}
