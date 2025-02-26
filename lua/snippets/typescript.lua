-- Imports
local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

--- Snippets definitions
ls.add_snippets("typescript", {
  -- Console log
  s("cl", fmt("console.log('{}');", { i(1, "message") })),
  s("ci", fmt("console.info(' {}')", { i(1, "message") })),
  s("ce", fmt("console.error(' {}')", { i(1, "message") })),
  s("cc", fmt("console.log(' {}')", { i(1, "message") })),

  -- Arrow function
  s(
    "fn",
    fmt("const {} = ({}) => {{\n  {}\n}};", {
      i(1, "functionName"),
      i(2, "params"),
      i(3, "// body"),
    })
  ),

  -- Export default
  s("exp", fmt("export default {};", { i(1, "moduleName") })),

  -- Interface TypeScript
  s(
    "interface",
    fmt(
      [[
    interface {} {{
      {}: {};
    }}
  ]],
      { i(1, "MyInterface"), i(2, "key"), i(3, "string") }
    )
  ),

  -- Promise avec async/await
  s(
    "promise",
    fmt(
      [[
    const {} = async ({}) => {{
      try {{
        {}
      }} catch (error) {{
        console.error(error);
      }}
    }};
  ]],
      {
        i(1, "fetchData"),
        i(2, "params"),
        i(3, "// body"),
      }
    )
  ),
})
