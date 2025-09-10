
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { hl = "GitGutterAdd", text = "│", numhl = "GitGutterAddNr" },
      change = { hl = "GitGutterChange", text = "│", numhl = "GitGutterChangeNr" },
      delete = { hl = "GitGutterDelete", text = "_", numhl = "GitGutterDeleteNr" },
      topdelete = { hl = "GitGutterDelete", text = "‾", numhl = "GitGutterDeleteNr" },
      changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitGutterChangeNr" },
    },
    numhl = true,          -- 行番号に色を付ける
    linehl = false,        -- 行全体をハイライトする
    watch_gitdir = { interval = 1000 },
    sign_priority = 6,
    update_debounce = 100,
  },
}
