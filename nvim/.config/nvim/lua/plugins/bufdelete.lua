
return {
  "famiu/bufdelete.nvim",
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>bd", ":Bdelete<CR>", opts)  
    map("n", "<leader>bo", ":%Bdelete<CR>", opts)
  end,
}
