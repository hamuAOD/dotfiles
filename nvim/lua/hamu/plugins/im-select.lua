return{
  "keaising/im-select.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("im_select").setup({
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "/opt/homebrew/bin/im-select",
    })
  end,
}
-- Install im-select
-- brew tap daipeihust/tap && brew install im-select
-- [List]
-- com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese
-- com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'
-- com.apple.keylayout.ABC
