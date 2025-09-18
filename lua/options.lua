require "nvchad.options"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
elseif vim.fn.has("linux") == 1 then
    vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {
      ['+'] = 'wl-copy --type text/plain',
      ['*'] = 'wl-copy --primary --type text/plain',
    },
    paste = {
      ['+'] = function()
        return vim.fn.systemlist('wl-paste --no-newline | sed -e "s/\r$//"', {}, 1)
      end,
      ['*'] = function()
        return vim.fn.systemlist('wl-paste --primary --no-newline | sed -e "s/\r$//"', {}, 1)
      end,
    },
    cache_enabled = true,
  }
  vim.opt.clipboard = 'unnamedplus' 
end
