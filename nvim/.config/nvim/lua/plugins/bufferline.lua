return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = false,
				show_close_icon = false,
				always_show_bufferline = true,
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", padding = 1 },
				},
				-- バッファをフィルタする
				custom_filter = function(bufnr)
					local ft = vim.bo[bufnr].filetype
					local bt = vim.bo[bufnr].buftype
					-- ターミナルやquickfixを除外して、通常ファイルだけ残す
					if bt == "terminal" or bt == "quickfix" then
						return false
					end
					return true
				end,
			},
		})
	end,
}
