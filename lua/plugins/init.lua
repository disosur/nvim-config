return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "templ"},
    config = function()
      require("nvim-ts-autotag").setup()
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
        "rust-analyzer",
        "clangd",
        "clang-format",
        "eslint-lsp",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "typescript-language-server",
        "svelte-language-server",
        "gofumpt",
        "goimports-reviser",
        "htmx-lsp"
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
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "templ"
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require('flutter-tools').setup {
        ui = {
          border = "rounded",
          notification_style = 'plugin'
        },
      decorations = {
        statusline = {
        app_version = false,
        device = false,
        project_config = false,
        }
      },
      flutter_lookup_cmd = nil,
      flutter_path = "/home/disosur/fvm/versions/stable/bin/",
      root_patterns = { ".git", "pubspec.yaml" },
      fvm = true,
      widget_guides = {
        enabled = true,
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = true,
        renameFilesWithClasses = "prompt", -- "always"
        enableSnippets = true,
        updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
      },
      closing_tags = {
        highlight = "ErrorMsg", -- highlight for the closing tag
        prefix = ">", -- character to use for close tag e.g. > Widget
        enabled = true -- set to false to disable
      },
    }
    end
  },
  {
    "dart-lang/dart-vim-plugin"
  },
}
