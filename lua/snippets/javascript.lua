local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("stdin", {
    t('const inputs = require("fs").readFileSync("/dev/stdin", "utf-8").trim().split("\\n");'),
  }),
}
