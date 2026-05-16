  -- Statusline

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "github_dark_default"
      },
      sections = {
        lualine_x = {
          function()
            -- auto-session.nvim
            return require("auto-session.lib").current_session_name(true)
          end,
        },
      },
    })
  end,
}
