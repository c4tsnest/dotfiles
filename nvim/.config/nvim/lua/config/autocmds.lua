vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		vim.b.format_on_save = true
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.py", "*.lua", "*.v", "*.rs" },
	callback = function()
		if vim.b.format_on_save then
			vim.lsp.buf.format({ async = false })
		end
		-- 	if not vim.b.format_on_save then
		-- 		return
		-- 	end
		--
		-- 	local file = args.file
		-- 	local ext = vim.fn.fnamemodify(file, ":e")
		--
		-- 	if ext == "typ" then
		-- 		local file_ = vim.fn.fnamemodify(args.file, ":p")
		-- 		local dir = vim.fn.fnamemodify(file, ":h")
		--
		-- 		vim.fn.jobstart({ "typstyle", "-i", file_ }, {
		-- 			cwd = dir,
		-- 			on_exit = function(_, code)
		-- 				vim.notify("typstyle finished with code " .. code)
		-- 			end,
		-- 			on_stderr = function(_, data)
		-- 				if data and #data > 0 then
		-- 					vim.notify("typstyle stderr:\n" .. table.concat(data, "\n"),
		-- 						vim.log.levels.ERROR)
		-- 				end
		-- 			end,
		-- 		})
		-- 	else
		-- 		vim.lsp.buf.format({ async = false })
		-- 	end
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.typ",
	callback = function(args)
		local file = vim.fn.fnamemodify(args.file, ":p")
		local dir = vim.fn.fnamemodify(file, ":h")

		vim.fn.jobstart({ "typstyle", "-i", file }, {
			cwd = dir,
			on_exit = function(_, code)
				if code == 0 then
					vim.cmd("checktime")
					vim.notify("typstyle formatted " .. file)
				else
					vim.notify("typstyle exited with code " .. code, vim.log.levels.ERROR)
				end
			end,
			-- on_stderr = function(_, data)
			-- 	if data and #data > 0 then
			-- 		vim.notify("typstyle stderr:\n" .. table.concat(data, "\n"), vim.log.levels
			-- 			.ERROR)
			-- 	end
			-- end,
		})
	end,
})
