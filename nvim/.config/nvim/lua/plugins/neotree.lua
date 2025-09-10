return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			-- 設定例
			sort_by = "name",
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
		})

		-- <leader>e でトグル
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
	end,
}
