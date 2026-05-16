-- AI Chat (CodeCompanion)

return {
  "olimorris/codecompanion.nvim",
  config = function()
    require("codecompanion").setup({
      adapters = {
        openai = {
          model = "gpt-4o",
        },
      },
    })
  end,
}
