local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function copilot_width()
	return math.max(32, math.floor(vim.o.columns * 0.17))
end

local float_term
local function get_float_term()
	if float_term then
		return float_term
	end

	local Terminal = require("toggleterm.terminal").Terminal
	float_term = Terminal:new({
		direction = "float",
		hidden = true,
		count = 98,
	})

	return float_term
end

local copilot_term
local function get_copilot_term()
	if copilot_term then
		return copilot_term
	end

	local Terminal = require("toggleterm.terminal").Terminal
	copilot_term = Terminal:new({
		cmd = "opencode",
		direction = "vertical",
		hidden = true,
		close_on_exit = false,
		count = 99,
		on_open = function(term)
			if term.window and vim.api.nvim_win_is_valid(term.window) then
				vim.api.nvim_set_current_win(term.window)
				vim.cmd("wincmd L")
				vim.api.nvim_win_set_width(term.window, copilot_width())
				vim.cmd("startinsert")
			end
		end,
	})

	return copilot_term
end

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
	local Terminal = require("toggleterm.terminal").Terminal
	Terminal:new({
		cmd = "lazygit",
		direction = "float",
		float_opts = { border = "curved" },
		hidden = true,
	}):toggle()
end, { noremap = true, silent = true, desc = "Open LazyGit" })

map("n", "<leader>tt", function()
	get_float_term():toggle()
end, { noremap = true, silent = true, desc = "Toggle floating terminal" })

map("n", "<leader>ac", function()
	local copilot_term = get_copilot_term()
	copilot_term:toggle()
	if copilot_term.window and vim.api.nvim_win_is_valid(copilot_term.window) then
		vim.api.nvim_win_set_width(copilot_term.window, copilot_width())
	end
end, { noremap = true, silent = true, desc = "Toggle Copilot CLI terminal" })

map("n", "<leader>al", function()
	local copilot_term = get_copilot_term()
	if copilot_term.window and vim.api.nvim_win_is_valid(copilot_term.window) then
		vim.api.nvim_set_current_win(copilot_term.window)
	else
		vim.cmd("wincmd l")
	end
end, { noremap = true, silent = true, desc = "Focus Copilot terminal (right)" })

map("n", "<leader>ah", "<C-w>h", { noremap = true, silent = true, desc = "Focus code window (left)" })

map("t", "<leader>tt", function()
	get_float_term():toggle()
end, { noremap = true, silent = true, desc = "Toggle floating terminal" })

map("t", "<leader>ah", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true, desc = "Focus code window (left)" })
map("t", "<leader>al", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true, desc = "Focus Copilot window (right)" })

map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>cr", vim.lsp.buf.rename, opts)
map('n', '<leader>d', vim.diagnostic.open_float, opts)
map("n", "<C-t>h", "gT", opts)
map("n", "<C-t>l", "gt", opts)

map("n", "<C-t>n", ":tabnew<CR>", opts)
map("n", "<C-t>d", ":tabclose<CR>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "<leader>uf", function()
	vim.b.format_on_save = not vim.b.format_on_save
	print("Format on save: " .. (vim.b.format_on_save and "ON" or "OFF"))
end, { desc = "Toggle format on save" })
