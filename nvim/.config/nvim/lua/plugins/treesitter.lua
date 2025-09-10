return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "python", "javascript", "typescript", "c", "cpp", "html", "css" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				custom_captures = {
					["comment"] = "Comment",
				},
			},
		},
	},
}
