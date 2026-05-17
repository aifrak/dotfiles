-- Theme

-- return {
--   "EdenEast/nightfox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local palette = require("theme.carbonfox.palette").palette
--     local spec = require("theme.carbonfox.spec").spec
--     local groups = require("theme.carbonfox.groups").groups
--     local plugin_groups = require("theme.carbonfox.plugins").plugins

--     require("nightfox").setup({
--       palettes = { carbonfox = palette },
--       specs = { carbonfox = spec },
--       groups = {
--         carbonfox = vim.tbl_extend("force", groups, plugin_groups),
--       },
--     })

--     vim.cmd("colorscheme carbonfox")
--   end,
-- }


return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup({
      groups = {
        github_dark_default = {
          -- Editor
          CursorLine = { bg = "#1c2128" },
          -- Treesitter
          ["@comment"] = { fg = "#62686f", style = "italic" },
          ["@string"] = { fg = "#98BE64" },
          ["@operator"] = { fg = "#CE9178" },
          ["@constant"] = { fg = "#DCDCAA" },
          ["@number"] = { fg = "#DCDCAA" },
          ["@string.regex"] = { fg = "#9CDCFE" },
          ["@string.escape"] = { fg = "#C586C0" },
          -- Elixir
          ["@variable.elixir"] = { fg = "#9CDCFE" },
          ["@function.call.elixir"] = { fg = "#DCDCAA" },
          ["@module.elixir"] = { fg = "#FF79C6" },
          ["@variable.anonymous.elixir"] = { fg = "#D93D42" },
          ["@string.sigil.elixir"] = { fg = "#D1BC69" },
          ["@string.charlist.elixir"] = { fg = "#29C750" },
          -- Dockerfile
          ["@variable.dockerfile"] = { fg = "#569CD6" },
          ["@macro.dockerfile"] = { fg = "#CE9178" },
          ["@property.dockerfile"] = { fg = "#4EC9B0" },
          -- Shell
          ["@comment.shebang.shell"] = { fg = "#9e5050" },
          ["@string.shell"] = { fg = "#FF9800" },
          ["@punctuation.bracket.shell"] = { fg = "#3EA0FF" },
          ["@parameter.shell"] = { fg = "#FBD600" },
          ["@function.call.shell"] = { fg = "#DCDCAA" },
          -- NeoTree
          NeoTreeRootName = { fg = "#79c0ff", bold = true },
          NeoTreeDirectoryIcon = { fg = "#e8a04c" },
        },
      },
    })
    vim.cmd("colorscheme github_dark_default")
  end,
}
