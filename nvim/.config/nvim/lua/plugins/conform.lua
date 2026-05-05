return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				systemverilog = { "verible" },
				verilog = { "verible" },
			},
			formatters = {
				verible = {
					-- Dynamically build the arguments for verible-verilog-format
					prepend_args = function(self, ctx)
						local args = {}

						-- Search upwards from the file for your rules file
						local rule_file = vim.fs.find(".rules.verible_format", {
							upward = true,
							path = ctx.dirname,
						})[1]

						if rule_file then
							table.insert(args, "--flagfile=" .. rule_file)
						end

						return args
					end,
				},
			},
		})
	end,
}
