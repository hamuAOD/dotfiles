return{
  "keaising/im-select.nvim",
  cond = function()
    local os = vim.loop.os_uname().sysname
    return os == "Darwin"  -- Mac なら true（ロードされる）、Ubuntu なら false（ロードされない）
  end,
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("im_select").setup({
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "/opt/homebrew/bin/macism",

      -- 以下のイベント時に、デフォルトのIMEになる
      set_default_events  = { "VimEnter", "InsertEnter", "InsertLeave" },

      -- 以下のイベント時に、前回使われていたIMEになる（無効にしている）
      set_previous_events = {},
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
