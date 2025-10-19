return {
	"jbyuki/vcd-viewer.nvim",
	ft = "vcd",
	config = function()
		vim.keymap.set("n", "<leader>wv", function()
			require("vcd-viewer").view()
		end, { desc = "View VCD waveform" })
	end,
}
