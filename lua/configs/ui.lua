local uiconf = {
  icons = {
    Error = "󰊠 ",
    Warn = "󰊠 ",
    Hint = "󰊠 ",
    Info = "󰊠 ",
  },
  dashboard = {
    sections = {
      { section = "header" },
      { section = "keys", icon = " ", title = "Actions", indent = 2, padding = 1 },
      { section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 1 },
      { section = "startup" },
    },
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "󱥚 ", key = "t", desc = "Themes", action = ":Themify" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    }
  }
}

for type, icon in pairs(uiconf.icons) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return uiconf
