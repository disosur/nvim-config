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
    "tpope/vim-fugitive",
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
        "eslint-lsp",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "typescript-language-server",
        "svelte-language-server",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "angular-language-server",
        "vue-language-server",
        "bash-language-server",
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
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "dart",
        "svelte",
        "templ",
        "vue",
        "astro",
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    config = function()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
          notification_style = "plugin",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
            project_config = true,
          },
        },
        flutter_lookup_cmd = nil,
        flutter_path = "/home/disosur/fvm/versions/stable/bin/",
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = true,
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
          notify_errors = true, -- if there is an error whilst running then notify the user
          open_cmd = "tabedit", -- command to use to open the log buffer
        },
        dev_tools = {
          autostart = true,          -- autostart devtools server if not detected
          auto_open_browser = false, -- Automatically opens devtools in the browser
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = true,    -- if true this will open the outline automatically when it is first populated
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt", -- "always"
          enableSnippets = true,
          updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        },
        closing_tags = {
          highlight = "ErrorMsg", -- highlight for the closing tag
          prefix = ">",           -- character to use for close tag e.g. > Widget
          enabled = true,         -- set to false to disable
        },
      }
    end,
  },
  {
    "dart-lang/dart-vim-plugin",
  },
  {
    "mefercs/flutter-snippets-for-neovim",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
