# nvim

[lazy.nvim](https://github.com/folke/lazy.nvim) ベースのNeovim設定。

## Features

- **LSP / 補完**: mason + nvim-lspconfig、補完は blink.cmp + LuaSnip
- **デバッグ / テスト**: nvim-dap (+ dap-view)、neotest。アダプターは端末ごとに追加する
- **端末固有設定の分離**: `lua/plugins/local/` と `lua/local_options.lua` をgit管理外にして、端末ごとに追加・上書きできる
- **Git**: gitsigns、lazygit
- **UI**: bufferline / lualine / neo-tree / edgy / trouble ほか

## Structure

| パス | 内容 |
| --- | --- |
| `init.lua` | エントリポイント |
| `lua/options.lua` `mappings.lua` `autocmds.lua` | 共通のオプション・キーマップ・autocmd |
| `lua/configs/` | lazy.nvim / UI まわりの設定 |
| `lua/plugins/` | プラグインspec (カテゴリ別) |
| `lua/plugins/local/` | 端末固有のプラグインspec (gitignore) |
| `lua/local_options.lua` | 端末固有のオプション (gitignore) |

## Local Settings

端末固有の設定はgit管理から外し、以下のファイルを各端末で作成して記述する。

| パス | 用途 |
| --- | --- |
| `lua/plugins/local/*.lua` | 端末固有のプラグイン・設定 (lazy.nvimのspec) |
| `lua/local_options.lua` | 端末固有のオプション |

いずれも `.gitignore` 対象。

### Plugins

`lua/plugins/local/` にluaファイルを作成する。

```lua
-- lua/plugins/local/example.lua
return {
  "author/plugin.nvim",
}
```

共通側と同じプラグイン名のspecを書くと、`opts` と `dependencies` はマージされる。
`config` / `init` はマージされず上書きになるので、共通側のspecに対しては書かない。

### Debug Adapters

nvim-dap本体は共通。アダプターは端末ごとに追加する。

**アダプターがプラグインとして存在する場合**

そのプラグインのspecを書く。`dependencies` でnvim-dapが先にロードされる。

```lua
-- lua/plugins/local/dap-python.lua
return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    require("dap-python").setup("python")
  end,
}
```

**プラグインがなく `dap.adapters` を直接書く場合**

`LazyLoad` autocmdでnvim-dapのロード後に実行する。

```lua
-- lua/plugins/local/dap.lua
local function on_load(name, fn)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn()
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(ev)
        if ev.data == name then
          fn()
          return true
        end
      end,
    })
  end
end

on_load("nvim-dap", function()
  local dap = require("dap")
  dap.adapters.hoge = { type = "executable", command = "hoge-dap" }
  dap.configurations.hoge = {
    { type = "hoge", request = "launch", name = "Launch" },
  }
end)

-- specは空でOK
return {}
```

### Neotest Adapters

neotest本体は共通。アダプターは `dependencies` と `opts` のマージで追加する。

```lua
-- lua/plugins/local/neotest.lua
return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/neotest-python" },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    table.insert(opts.adapters, require("neotest-python")({ runner = "pytest" }))
  end,
}
```

### Options

端末に依存する設定は `lua/local_options.lua` を作成し記述する。

```lua
-- lua/local_options.lua
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
