return{
  "keaising/im-select.nvim",
  config = function()
    require("im_select").setup({
      default_im_select = "com.apple.keylayout.ABC"
    })
  end,
}
-- Install im-select
-- brew tap daipeihust/tap && brew install im-select
