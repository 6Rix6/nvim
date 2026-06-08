# NeoVim

## getting started
```sh
cd ~/.config && git clone https://github.com/6Rix6/nvim
```

## 依存関係
- ripgrep
- build-essential
- lazygit
- nodejs
- (linux) wl-clipboard

## プラグイン
### 共通
`lua/plugins/common`にファイルを作成し、`lua/plugins/init.lua`に追加

### ローカル
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

