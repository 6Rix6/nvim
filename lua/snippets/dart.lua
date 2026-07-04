local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s(
    "freezed",
    fmt(
      [[
import 'package:freezed_annotation/freezed_annotation.dart';

part '{}.freezed.dart';
part '{}.g.dart';

@freezed
sealed class {} with _${} {{
  const factory {}({{
    {}
  }}) = _{};

  factory {}.fromJson(Map<String, dynamic> json) =>
      _${}FromJson(json);
}}
]],
      {
        i(1, "model_name"),
        rep(1),
        i(2, "ClassName"),
        rep(2),
        rep(2),
        i(3, "required String field,"),
        rep(2),
        rep(2),
        rep(2),
      }
    )
  ),

  s(
    "freezedu",
    fmt(
      [[
import 'package:freezed_annotation/freezed_annotation.dart';

part '{}.freezed.dart';

@freezed
sealed class {} with _${} {{
  const factory {}.initial() = {}Initial;
  const factory {}.loading() = {}Loading;
  const factory {}.data({}) = {}Data;
  const factory {}.error(String message) = {}Error;
}}
]],
      {
        i(1, "model_name"),
        i(2, "ClassName"),
        rep(2),
        rep(2),
        rep(2), rep(2),
        rep(2), rep(2),
        i(3, "required dynamic value,"),
        rep(2),
        rep(2), rep(2),
      }
    )
  ),

  s(
    "freezedplain",
    fmt(
      [[
import 'package:freezed_annotation/freezed_annotation.dart';

part '{}.freezed.dart';

@freezed
sealed class {} with _${} {{
  const factory {}({{
    {}
  }}) = _{};
}}
]],
      {
        i(1, "model_name"),
        i(2, "ClassName"),
        rep(2),
        rep(2),
        i(3, "required String field,"),
        rep(2),
      }
    )
  ),
}
