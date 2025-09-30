return {
	"simeji/winresizer",
	cmd = { "WinResizerStartResize" },
	init = function()
		vim.g.winresizer_start_key = "<C-e>"
	end,
}
