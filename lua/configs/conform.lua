local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- html = { "prettier" },
    dart = { "dart_format" }, -- Add this line for Dart formatting
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    lsp_fallback = true,
  },
}
require("conform").setup(options)
