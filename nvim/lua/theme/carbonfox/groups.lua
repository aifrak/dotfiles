-- Treesitter + UI highlight groups

local palette = require("theme.carbonfox.palette").palette
local spec = require("theme.carbonfox.spec").spec

local M = {}

M.groups = {
  -- Editor
  -- Visual = { bg = palette.sel0 },
  -- Pmenu = { link = "NightfoxPmenu"  },

  -- Treesitter
  ["@string"] = { fg = spec.syntax.string },
  ["@comment"] = { fg = spec.syntax.comment, style = "italic" },
  ["@operator"] = { fg = spec.syntax.operator },
  ["@constant"] = { fg = spec.syntax.constant },
  ["@number"] = { fg = spec.syntax.number },
  ["@string.regex"] = { fg = spec.syntax.regex },
  ["@string.escape"] = { fg = spec.syntax.escape },

  -- Elixir
  ["@variable.elixir"] = { fg = spec.elixir.variable },
  ["@function.call.elixir"] = { fg = spec.elixir.funcall },
  ["@module.elixir"] = { fg = spec.elixir.module },
  ["@variable.anonymous.elixir"] = { fg = spec.elixir.lambda },
  ["@string.sigil.elixir"] = { fg = spec.elixir.sigil1 },
  ["@string.charlist.elixir"] = { fg = spec.elixir.sigil2 },

  -- Dockerfile
  ["@variable.dockerfile"] = { fg = spec.docker.variable },
  ["@macro.dockerfile"] = { fg = spec.docker.macro },
  ["@property.dockerfile"] = { fg = spec.docker.property },

  -- Shell
  ["@comment.shebang.shell"] = { fg = spec.shell.shebang },
  ["@string.shell"] = { fg = spec.shell.arg1 },
  ["@punctuation.bracket.shell"] = { fg = spec.shell.arg2 },
  ["@parameter.shell"] = { fg = spec.shell.param },
  ["@function.call.shell"] = { fg = spec.shell.command },
}

return M
