local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.config.setup({
  enable_autosnippets = true,
})

return {
  s({
    trig = "sheb;",
    snippetType = "autosnippet",
  }, {
    t("#!/usr/bin/env bash"),
  }),

  s({
    trig = "#!",
    snippetType = "autosnippet",
  }, {
    t({
      "#!/usr/bin/env bash",
      "",
      "set -eu",
      "",
    }),
  }),

  -- if
  s("if", {
    t("if [[ "),
    i(1, "condition"),
    t({ " ]]; then", "  " }),
    i(0),
    t({ "", "fi" }),
  }),

  -- if / else
  s("ifel", {
    t("if [[ "),
    i(1, "condition"),
    t({ " ]]; then", "  " }),
    i(2),
    t({ "", "else", "  " }),
    i(0),
    t({ "", "fi" }),
  }),

  -- for
  s("for", {
    t("for "),
    i(1, "item"),
    t(" in "),
    i(2, "items"),
    t({ "; do", "  " }),
    i(0),
    t({ "", "done" }),
  }),

  -- while
  s("while", {
    t("while [[ "),
    i(1, "condition"),
    t({ " ]]; do", "  " }),
    i(0),
    t({ "", "done" }),
  }),

  -- function
  s("func", {
    i(1, "function_name"),
    t({ "() {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- case
  s("case", {
    t("case "),
    i(1, "$var"),
    t({ " in", '  "' }),
    i(2, "value"),
    t({ '")', "    " }),
    i(3),
    t({ "", "    ;;", "  *)", "    " }),
    i(0),
    t({ "", "    ;;", "esac" }),
  }),

  -- 引数チェック
  s("argc", {
    t({ "if [[ $# -eq 0 ]]; then", '  echo "Usage: $0 ' }),
    i(1, "[args...]"),
    t({ '"', "  exit 1", "fi" }),
  }),

  -- ファイル存在確認
  s("iff", {
    t('if [[ -f "'),
    i(1, "$file"),
    t({ '" ]]; then', "  " }),
    i(0),
    t({ "", "fi" }),
  }),

  -- ディレクトリ存在確認
  s("ifd", {
    t('if [[ -d "'),
    i(1, "$dir"),
    t({ '" ]]; then', "  " }),
    i(0),
    t({ "", "fi" }),
  }),

  -- command -v
  s("cmdv", {
    t("if ! command -v "),
    i(1, "command"),
    t({ " >/dev/null 2>&1; then", '  echo "' }),
    i(2, "command not found"),
    t({ '" >&2', "  exit 1", "fi" }),
  }),
}
