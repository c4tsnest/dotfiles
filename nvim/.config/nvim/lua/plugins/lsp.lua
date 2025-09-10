return {
	{
		"williamboman/mason.nvim",
		version = "1.*",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		version = "1.*",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "lua_ls", "clangd" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- C/C++
			lspconfig.clangd.setup({
				cmd = { "clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				capabilities = vim.lsp.protocol.make_client_capabilities(),
				on_attach = function(client, bufnr)
					local opts = { noremap = true, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
					-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
				end,
			})

			-- Python
			lspconfig.pyright.setup({})

			-- Lua (Neovim 用)
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
							},
						},
					},
				},
			})
		end,
	},
}
