return {
	{
		"echasnovski/mini.indentscope",
		opts = {
			symbol = "│",
			draw = { animation = function() return 0 end },
			options = { try_as_border = true },
		},
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
