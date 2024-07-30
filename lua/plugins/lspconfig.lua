return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Define the templ_format function
			local templ_format = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local cmd = "templ fmt " .. vim.fn.shellescape(filename)

				vim.fn.jobstart(cmd, {
					on_exit = function()
						if vim.api.nvim_get_current_buf() == bufnr then
							vim.cmd('e!')
						end
					end,
				})
			end

			-- Define the on_attach function
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>lf", templ_format, opts)
				-- Add any other keybindings or setup you want here
			end

			-- Create an autocmd to run templ_format on save for .templ files
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = { "*.templ" },
				callback = templ_format
			})

			local servers = { "tsserver", "eslint" }
			-- lsps with default config
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					on_attach = on_attach,
					on_init = on_init,
					capabilities = capabilities,
				}
			end

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							disable = { "different-requires" },
						},
					},
				},
			})

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

			lspconfig.tailwindcss.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "templ", "astro", "javascript", "typescript", "react" },
				settings = {
					tailwindCSS = {
						includeLanguages = {
							templ = "html",
						},
					},
				},
			}

			lspconfig.templ.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
