local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("stdin", {
    t('const inputs = require("fs").readFileSync("/dev/stdin", "utf-8").trim().split("\\n");'),
  }),

  s("nums", {
    t("const nums = inputs.shift().split(' ').map(Number);"),
  }),

  s("fori", {
    t("for (let i = 0; i < "), i(1, "n"), t("; i++) {"),
    t({"", "  "}), i(2, "// TODO"),
    t({"", "}", ""}),
  }),
      
  s("out", {
    t("console.log("), i(1, "result"), t(");"),
  }),

  s("grid", {
    t("const grid = inputs.map(line => line.split('').map(c => c));"),
  }),

  s("cases", {
    t("const t = Number(inputs.shift());"),
    t({"", "for (let i = 0; i < t; i++) {", "  "}),
    i(1, "// solve one case"),
    t({"", "}", ""}),
  }),

  s("gcd", {
    t("const gcd = (a, b) => b ? gcd(b, a % b) : a;"),
  }),

  s("lcm", {
    t("const lcm = (a, b) => a / gcd(a, b) * b;"),
  }),

  s("bsearch", {
    t({"function binarySearch(arr, target) {",
       "  let left = 0, right = arr.length - 1;",
       "  while (left <= right) {",
       "    const mid = Math.floor((left + right) / 2);",
       "    if (arr[mid] === target) return mid;",
       "    if (arr[mid] < target) left = mid + 1;",
       "    else right = mid - 1;",
       "  }",
       "  return -1;",
       "}", ""}),
  }),
}
