local icons = require("configs.ui").icons

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '/', right = '\\' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = true,
      refresh = {
        statusline = 16,
        tabline = 100,
        winbar = 200,
        refresh_time = 16, -- ~60fps
        events = {
          'WinEnter',
          'BufEnter',
          'BufWritePost',
          'SessionLoadPost',
          'FileChangedShellPost',
          'VimResized',
          'Filetype',
          'CursorMoved',
          'CursorMovedI',
          'ModeChanged',
        },
      }
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'filename' },
      lualine_c = {
        'branch',
        'diff',
      },
      lualine_x = {
        {
          "diagnostics",
          symbols = {
            error = icons.Error,
            warn = icons.Warn,
            hint = icons.Hint,
            info = icons.Info,
          },
        },
        {
          'lsp_status',
          icon = '',
          show_name = true,
        },
        'filetype'
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    extensions = { "neo-tree", "lazy", "mason", "toggleterm", "trouble" }
  }
}
