vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		vim.b.format_on_save = true
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.py", "*.lua" },
	callback = function()
		if vim.b.format_on_save then
			vim.lsp.buf.format({ async = false })
		end
	end,
})
