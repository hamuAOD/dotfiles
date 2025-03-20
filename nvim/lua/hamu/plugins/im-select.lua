return{
  "keaising/im-select.nvim",
  cond = vim.fn.has("macunix") == 1,  -- Mac ならロード
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("im_select").setup({
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "/opt/homebrew/bin/macism",
    })
  end,
}
-- Install im-select
-- brew tap daipeihust/tap && brew install im-select
-- Install macism
-- brew tap laishulu/homebrew && brew install macism
-- [List]
-- com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese
-- com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'
-- com.apple.keylayout.ABC
