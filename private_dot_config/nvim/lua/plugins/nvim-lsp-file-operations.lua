return {
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
  },
  config = function()
    require("lsp-file-operations").setup()
  end,
}
