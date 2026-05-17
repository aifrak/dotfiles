-- Which-key

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 300,
    spec = {
      -- Groups
      { "<leader>f", group = "find/files", icon = "" },
      { "<leader>g", group = "git", icon = "" },
      { "<leader>l", group = "lsp", icon = "" },
      { "<leader>q", group = "session", icon = "" },
      { "<leader>x", group = "diagnostics", icon = "" },
      { "<leader>b", group = "buffer", icon = "" },
      { "<leader>d", group = "debug", icon = "" },
      { "<leader>c", group = "code", icon = "" },
      -- Window proxy
      { "<leader>w", proxy = "<c-w>", group = "windows", icon = "" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
  },
}
