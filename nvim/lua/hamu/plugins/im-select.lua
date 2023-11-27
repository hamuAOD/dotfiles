return{
  "keaising/im-select.nvim",
  config = function()
    require("im_select").setup({
      default_im_select = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman",
    })
  end,
}
-- Install im-select
-- brew tap daipeihust/tap && brew install im-select
-- [List]
-- com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese
-- com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'
-- com.apple.keylayout.ABC
