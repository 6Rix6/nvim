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

## config
端末に依存する設定はlua/config.luaを作成し記述

```lua
local config = {}

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

config.clipboard = {
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

config.shell = "/bin/zsh"

return config
```

### 使用可能な設定
- `config.clipboard`: `vim.g.clipboard`
- `config.shell`: `vim.opt.shell`
