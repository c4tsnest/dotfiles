vim.keymap.set("i", "jj", "<esc><cmd>w<CR>")
vim.keymap.set("i", "kk", "<esc><cmd>w<CR>")

vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>")

vim.keymap.set("n", "<leader>|", ":vsplit<CR>")
vim.keymap.set("n", "<leader>-", ":split<CR>")

vim.keymap.set("n", "gb", "<C-o>")
vim.keymap.set("n", "gf", "<C-i>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gg", function()
	require("toggleterm.terminal").Terminal:new({
		cmd = "lazygit",
		direction = "float",
		float_opts = { border = "curved" },
		hidden = true,
	}):toggle()
end, { noremap = true, silent = true, desc = "Open LazyGit" })

vim.keymap.set("n", "<leader>tf", function()
	vim.b.format_on_save = not vim.b.format_on_save
	print("Format on save: " .. (vim.b.format_on_save and "ON" or "OFF"))
end, { desc = "Toggle format on save" })
-- vim.g.format_on_save = 0
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("FormatOnSave", {}),
--   callback = function()
--     if vim.g.format_on_save == 1 then
--       vim.lsp.buf.format({ async = false })
--     end
--   end,
-- })
