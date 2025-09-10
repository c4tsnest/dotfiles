
return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      -- 各キーのスクロール量
      mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>'},
      hide_cursor = true,          -- スクロール中にカーソルを隠す
      stop_eof = true,             -- EOFで停止
      respect_scrolloff = false,   -- scrolloffを尊重する
      cursor_scrolls_alone = true, -- カーソルだけでスクロール
      easing_function = "sine",    -- アニメーションの種類
      pre_hook = nil,
      post_hook = nil,
    })
  end
}
