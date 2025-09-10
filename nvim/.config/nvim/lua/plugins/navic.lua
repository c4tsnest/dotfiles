return {
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			local navic = require("nvim-navic")
			require("lspconfig").pyright.setup {
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			}
			require("lspconfig").clangd.setup {
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, bufnr)
					end
				end,
			}
		end,
	},
}
