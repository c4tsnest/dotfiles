return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- C/C++
			lspconfig.clangd.setup({
				cmd = { "clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				-- capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- local map = vim.keymap.set
					-- local opts = { noremap = true, silent = true }
					-- map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts)
					-- map("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
					-- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
					-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					-- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
				end,
			})

			-- Python
			lspconfig.pyright.setup({})

			-- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
						format = {
							enable = true,
							defaultConfig = { indent_style = "space", indent_size = "2" },
						},
					},
				},
			})
		end,
	},

	-- Mason
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
}
