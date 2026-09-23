local autocmd = vim.api.nvim_create_autocmd

local fold_group = vim.api.nvim_create_augroup("TsFolding", { clear = true })

autocmd("FileType", {
  group = fold_group,
  pattern = "*",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldtext = ""
  end,
})

local function open_dashboard_in_empty_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == ""
        and vim.bo[buf].filetype == ""
        and vim.api.nvim_buf_get_name(buf) == ""
    then
      Snacks.dashboard.open({ buf = buf, win = win })
      return
    end
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if vim.fn.argc() ~= 1 then return end
    local arg = vim.fn.argv(0)
    if vim.fn.isdirectory(arg) == 0 then return end

    vim.cmd.cd(arg)
    vim.schedule(open_dashboard_in_empty_win)
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    vim.schedule(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buflisted
            and vim.bo[buf].buftype == ""
            and vim.api.nvim_buf_get_name(buf) ~= ""
        then
          return
        end
      end
      open_dashboard_in_empty_win()
    end)
  end,
})
