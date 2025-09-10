-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<esc><cmd>w<CR>")
vim.keymap.set("i", "kk", "<esc><cmd>w<CR>")

vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-h>")
vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "gb", "<C-o>")

-- vim.opt.clipboard:append({ "unnamedplus" })
-- vim.g.clipboard = "clipboard"
vim.api.nvim_set_option("clipboard", "unnamed")
-- vim.g.format_on_save = 0
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("FormatOnSave", {}),
--   callback = function()
--     if vim.g.format_on_save == 1 then
--       vim.lsp.buf.format({ async = false })
--     end
--   end,
-- })
