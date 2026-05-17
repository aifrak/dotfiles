-- Plugin‑specific highlights

local palette = require("theme.carbonfox.palette").palette

local M = {}

M.plugins = {
  GitSignsAdd = { fg = "#29C750" },
  GitSignsChange = { fg = "#3EA0FF" },
  GitSignsDelete = { fg = "#D93D42" },
}

return M
