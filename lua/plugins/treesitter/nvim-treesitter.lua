return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufNewFile", "BufReadPre" },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "lua", "luadoc", "printf", "vim", "vimdoc"
    },
  },
};
