local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = { "tsserver", "tailwindcss", "eslint", "clangd" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup({})

lspconfig.gopls.setup({
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    env = {
      GOEXPERIMENT = "rangefunc",
    },
    formatting = {
      gofumpt = true,
    },
  },
})

require('lspconfig').tailwindcss.setup({
  settings = {
    includeLanguages = {
      templ = "html",
      svelte = "html",
      ["typescriptreact"] = "typescript",
    },
  },
})
