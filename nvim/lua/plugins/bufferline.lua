-- Buffer enhancement (VSCode tabs)

return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/snacks.nvim", -- Used to avoid closing windows on closing current tab
  },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        groups = {
          options = {
            toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
          },
          items = {
            -- Pinning
            require('bufferline.groups').builtin.pinned:with({ icon = "󰐃 " }),

            -- Grouping
            {
              name = "Tests",
              highlight = {underline = true, sp = "blue"},
              priority = 2, -- determines where it will appear relative to other groups (Optional)
              icon = " ",
              matcher = function(buf)
                return buf.name:match('%_test') or buf.name:match('%_spec')
              end,
            },
            {
              name = "Docs",
              highlight = {undercurl = true, sp = "green"},
              auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
              matcher = function(buf)
                return buf.name:match('%.md') or buf.name:match('%.txt')
              end,
              separator = {
                style = require('bufferline.groups').separator.tab
              },
            }
          }
        },
        -- Shows error counts, then warning counts, then info counts
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ""
          if diagnostics_dict["error"] then
            s = s .. diagnostics_dict["error"] .. " "
          end
          if diagnostics_dict["warning"] then
            s = s .. diagnostics_dict["warning"] .. " "
          end
          if diagnostics_dict["info"] then
            s = s .. diagnostics_dict["info"] .. " "
          end
          return s
        end,
        -- Commands to avoid closing windows on closing current tab
        close_command = function(bufnum)
          Snacks.bufdelete(bufnum)
        end,
        right_mouse_command = function(bufnum)
          Snacks.bufdelete(bufnum)
        end,
      },
    })
  end,
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
  },
}
