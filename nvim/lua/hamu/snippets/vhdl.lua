local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- entity スニペット
  s("entity", {
    t("entity "), i(1, "name"), t(" is"),
    t({ "", "end " }), i(1), t(";"),
  }),

  -- process スニペット
  s("process", {
    t("process("), i(1, "clk"), t({ ")", "begin", "  " }),
    i(0),
    t({ "", "end process;" }),
  }),
}
