return {
  -- import plugins
  { import = "plugins.cmp" },
  { import = "plugins.git" },
  { import = "plugins.lsp" },
  { import = "plugins.theme" },
  { import = "plugins.treesitter" },
  { import = "plugins.ui" },
  { import = "plugins.util" },

  -- import local plugins
  (function()
    local local_plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/local"
    if vim.fn.isdirectory(local_plugin_dir) == 1 then
      return { import = "plugins.local" }
    end
  end)(),
}
