local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "jj", "<esc><cmd>w<CR>", opts)
map("i", "kk", "<esc><cmd>w<CR>", opts)

map("n", "<C-h>", "<cmd>bprev<CR>", opts)
map("n", "<C-l>", "<cmd>bnext<CR>", opts)

map("n", "<leader>|", ":vsplit<CR>", opts)
map("n", "<leader>-", ":split<CR>", opts)

map("n", "gb", "<C-o>", opts)
map("n", "gf", "<C-i>", opts)

map("n", "gd", vim.lsp.buf.definition, opts)

map("n", "<leader>gg", function()
	require("toggleterm.terminal").Terminal:new({
		cmd = "lazygit",
		direction = "float",
		float_opts = { border = "curved" },
		hidden = true,
	}):toggle()
end, { noremap = true, silent = true, desc = "Open LazyGit" })

map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>cr", vim.lsp.buf.rename, opts)

map("n", "<C-t>h", "gT", opts)
map("n", "<C-t>l", "gt", opts)

map("n", "<C-t>n", ":tabnew<CR>", opts)
map("n", "<C-t>d", ":tabclose<CR>", opts)

map("n", "<leader>uf", function()
	vim.b.format_on_save = not vim.b.format_on_save
	print("Format on save: " .. (vim.b.format_on_save and "ON" or "OFF"))
end, { desc = "Toggle format on save" })
