--  Autocommands (quality-of-life automation)

local autocmd = vim.api.nvim_create_autocmd

--  Auto-save (Option 1: on focus lost / buffer leave)
--  Behaves like VSCode "Auto Save: onFocusChange"
autocmd({ "FocusLost", "BufLeave" }, {
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! w")
    end
  end,
})

--  Highlight text on yank (visual feedback)
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
  end,
})

--  Auto-resize splits when the window is resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

--  Better terminal behavior
autocmd("TermOpen", {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Open media files from OS instead of preview
autocmd("BufReadPost", {
  pattern = { "*.pdf", "*.png", "*.jpg", "*.jpeg", "*.gif", "*.mp3", "*.mp4", "*.wav" },
  callback = function()
    local file = vim.fn.expand("<afile>:p")
    local cmd
    if vim.fn.has("win32") == 1 then
      cmd = { "cmd", "/c", "start", "", file }
    elseif vim.fn.has("wsl") == 1 then
      cmd = { "wslview", file }
    else
      cmd = { "xdg-open", file }
    end
    vim.fn.jobstart(cmd, { detach = true })
    -- vim.schedule(function()
    --   local buf = vim.api.nvim_get_current_buf()
    --   if vim.api.nvim_buf_get_name(buf):match("%.pdf$") then
    --     vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    --     vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Opening in external application..." })
    --   end
    -- end)
  end,
})

--  WSL clipboard fix (if needed)
if vim.fn.has("wsl") == 1 then
  autocmd("TextYankPost", {
    callback = function()
      -- Ensures clipboard sync works smoothly in WSL
      vim.cmd("silent! :")
    end,
  })
end
