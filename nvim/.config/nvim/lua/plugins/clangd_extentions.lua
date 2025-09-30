return {
	"p00f/clangd_extensions.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		local opts = { noremap = true, silent = true }
		require("clangd_extensions").setup()
		vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
	end,
}
