# nvim

## local plugin
`lua/plugins/local`にluaファイルを作成

## local_options
端末に依存する設定はlua/local_options.luaを作成し記述

```lua
vim.opt.shell = "/bin/zsh"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}
```


