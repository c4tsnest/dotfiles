return {
	{
		"kaarmu/typst.vim",
		ft = "typst",
		config = function()
			vim.api.nvim_create_user_command('TypstWatchTdf', function()
				local typ_file = vim.fn.expand('%:p')
				local pdf_file = vim.fn.expand('%:p:r') .. ".pdf"

				vim.fn.jobstart(string.format(
					'nohup typst watch "%s" > /tmp/typst-watch.log 2>&1 &', typ_file
				))

				vim.fn.system(string.format([[sh -c '
				r_panel_id=$(wezterm cli split-pane --right)
				echo "tdf '%s'\n" | wezterm cli send-text --no-paste --pane-id $r_panel_id
        ']], pdf_file))

				print("Typst watch + tdf preview started for " .. typ_file)
			end, {})
			vim.keymap.set('n', '<leader>tw', ':TypstWatchTdf<CR>', { noremap = true, silent = true })
		end,
	},
	{
		"chomosuke/typst-preview.nvim",
		config = function()
			-- require("typst-preview").setup({
			-- 	open_cmd =
			-- 	[[sh -c '
			-- 	r_panel_id=$(wezterm cli split-pane --right)
			-- 	echo "curl -sL \"%s\" -o /tmp/typst-preview.pdf && tdf /tmp/typst-preview.pdf" | wezterm cli send-text --no-paste --pane-id $r_panel_id 			        '
			-- 	]],
			-- })
		end,
		ft = "typst",
		-- build = function()
		-- 	vim.fn.system("cargo install --locked typst-preview")
		-- end,
	},
}
