-- Spectre (Find & Replace)

return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("spectre").setup()

    vim.keymap.set("n", "<leader>sr", "<cmd>Spectre<cr>")
  end,
}
