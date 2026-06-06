local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports" },
    css = { "prettier" },
    html = { "prettier" },
    js = { "prettier" },

    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true
  },
}

return options
