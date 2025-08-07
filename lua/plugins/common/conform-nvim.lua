return {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- for format on save
    opts = require "configs.conform",
}
