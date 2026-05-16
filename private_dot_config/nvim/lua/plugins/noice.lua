-- Notifications + UI

return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("notify").setup({
      background_colour = "#161B22",
    })

    require("noice").setup({
      presets = {
        command_palette = true,
        long_message_to_split = true,
      },
    })
  end,
}
