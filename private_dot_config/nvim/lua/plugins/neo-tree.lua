-- Neo-tree

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<cr>",
      desc = "Toggle Neotree file explorer",
    },
    {
      "<leader>ft",
      ":Neotree reveal<CR>",
      desc = "Neotree: reveal current file in tree",
    },
  },
  config = function()
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end

    local events = require("neo-tree.events")
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      -- snacks.vim
      event_handlers = {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      },
      filesystem = {
        -- hijack_netrw_behavior = "open_default",
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          -- visible = true,
        },
      },
    })
  end,
}
