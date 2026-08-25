local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- function
  s("def", {
    t("def "),
    i(1, "function_name"),
    t("("),
    i(2),
    t(") -> "),
    i(3, "None"),
    t({ ":", "    " }),
    i(0, "pass"),
  }),

  -- async function
  s("adef", {
    t("async def "),
    i(1, "function_name"),
    t("("),
    i(2),
    t(") -> "),
    i(3, "None"),
    t({ ":", "    " }),
    i(0, "pass"),
  }),

  -- class
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ ":", "    def __init__(self, " }),
    i(2),
    t({ ") -> None:", "        " }),
    i(0, "pass"),
  }),

  -- __init__ method
  s("init", {
    t("def __init__(self, "),
    i(1),
    t({ ") -> None:", "    " }),
    i(0, "pass"),
  }),

  -- dataclass
  s("dataclass", {
    t({ "@dataclass", "class " }),
    i(1, "ClassName"),
    t({ ":", "    " }),
    i(2, "field: str"),
    t({ "", "    " }),
    i(0),
  }),

  -- property
  s("prop", {
    t({ "@property", "def " }),
    i(1, "name"),
    t("(self) -> "),
    i(2, "str"),
    t({ ":", "    " }),
    i(0, "return self._name"),
  }),

  -- try / except
  s("try", {
    t({ "try:", "    " }),
    i(1),
    t({ "", "except " }),
    i(2, "Exception"),
    t(" as "),
    i(3, "exc"),
    t({ ":", "    " }),
    i(0, "raise"),
  }),

  -- with
  s("with", {
    t("with "),
    i(1, "expression"),
    t(" as "),
    i(2, "value"),
    t({ ":", "    " }),
    i(0, "pass"),
  }),

  -- main function and guard
  s("main", {
    t({ "def main() -> None:", "    " }),
    i(0, "pass"),
    t({ "", "", "", 'if __name__ == "__main__":', "    main()" }),
  }),

  -- if __name__ == "__main__"
  s("ifmain", {
    t({ 'if __name__ == "__main__":', "    " }),
    i(0, "main()"),
  }),

  -- argparse command-line entry point
  s("argparse", {
    t({
      "import argparse",
      "",
      "",
      "def parse_args() -> argparse.Namespace:",
      "    parser = argparse.ArgumentParser(description=",
    }),
    i(1, '"description"'),
    t({ ")", '    parser.add_argument("' }),
    i(2, "name"),
    t('")'),
    t({ "", "    return parser.parse_args()", "", "", "def main() -> None:", "    args = parse_args()", "    " }),
    i(0),
    t({ "", "", "", 'if __name__ == "__main__":', "    main()" }),
  }),

  -- pytest test function
  s("test", {
    t("def test_"),
    i(1, "behavior"),
    t({ "() -> None:", "    " }),
    i(2, "actual = None"),
    t({ "", "    assert actual == " }),
    i(0, "expected"),
  }),

  -- pytest fixture
  s("fixture", {
    t({ "@pytest.fixture", "def " }),
    i(1, "fixture_name"),
    t("() -> "),
    i(2, "object"),
    t({ ":", "    " }),
    i(0, "return object()"),
  }),
}
