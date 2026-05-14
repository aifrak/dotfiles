-- VSCode syntax colors

local M = {}

M.spec = {
  syntax = {
    comment  = "#62686f",
    string   = "#98BE64",
    operator = "#CE9178",
    regex    = "#9CDCFE",
    escape   = "#C586C0",
    number   = "#DCDCAA",
    constant = "#DCDCAA",
  },

  elixir = {
    variable = "#9CDCFE",
    funcall  = "#DCDCAA",
    module   = "#FF79C6",
    lambda   = "#D93D42",
    sigil1   = "#D1BC69",
    sigil2   = "#29C750",
  },

  docker = {
    variable = "#569CD6",
    macro    = "#CE9178",
    property = "#4EC9B0",
  },

  shell = {
    shebang  = "#9e5050",
    arg1     = "#FF9800",
    arg2     = "#3EA0FF",
    arg3     = "#B5CEA8",
    eval     = "#C586C0",
    param    = "#FBD600",
    command  = "#DCDCAA",
    option   = "#D16969",
    casepat  = "#4EC9B0",
  },

  brackets = {
    b1 = "#FBD600",
    b2 = "#D470D8",
    b3 = "#3EA0FF",
  },
}

return M
