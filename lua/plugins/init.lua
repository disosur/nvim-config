return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "templ" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "gopls",
        "tailwindcss-language-server",
        "rustywind",
        "bash-language-server",
        "eslint-lsp",
        "prettierd",
        "typescript-language-server",
        "svelte-language-server",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "rust-analyzer",
        "clangd",
        "clang-format",
        "templ",
        "zls",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "templ",
        "rust",
        "zig",
        "elixir",
      },
    },
  },
}
