-- AI Inline (Minuet)

return {
  "milanglacier/minuet-ai.nvim",
  config = function()
    require("minuet").setup({
      provider = "openai",
      model = "gpt-4o-mini",
    })
  end,
}
