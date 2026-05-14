-- Session management

return {
  "rmagatti/auto-session",
  lazy = false,
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_restore = true,
    auto_save = true,
    suppressed_dirs = { "~/", "~/Downloads", "/" },
    bypass_save_filetypes = { "neo-tree", "neo-tree-popup", "alpha", "dashboard", "snacks_dashboard" },
    post_restore_cmds = {
      function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          -- Avoid creating `[No Name]` tab at session restore
          if vim.api.nvim_buf_get_name(buf) == "" and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end,
    },
  },
}
