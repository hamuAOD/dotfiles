local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.config.setup({
  enable_autosnippets = true,
})

return {
  -- entity スニペット
  s("ltest", {
    t("lua test!! "),
  }),
  s({
    trig = "shebang;",
    snippetType = "autosnippet",
  }, {
    t("#!/usr/bin/env bash"),
  }),
}
