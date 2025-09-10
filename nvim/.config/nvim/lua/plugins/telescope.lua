return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		-- Space を2回押したときのマッピング
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live Grep" })
	end,
}
