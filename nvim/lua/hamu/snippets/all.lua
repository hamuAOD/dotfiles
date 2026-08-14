local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.config.setup({
  enable_autosnippets = true,
})

return {
  -- entity スニペット
  s("lstest", {
    t("luasnippet test!! "),
  }),
}
