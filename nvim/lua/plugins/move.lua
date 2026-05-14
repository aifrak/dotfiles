return {
  "fedepujol/move.nvim",
  event = "VeryLazy",
  config = function()
    -- NORMAL MODE — move lines
    vim.keymap.set("n", "<A-Up>", "<Cmd>MoveLineUp<CR>", { desc = "Move line up" })
    vim.keymap.set("n", "<A-Down>", "<Cmd>MoveLineDown<CR>", { desc = "Move line down" })

    -- VISUAL MODE — move selected blocks
    vim.keymap.set("v", "<A-Up>", "<Cmd>MoveBlockUp<CR>", { desc = "Move block up" })
    vim.keymap.set("v", "<A-Down>", "<Cmd>MoveBlockDown<CR>", { desc = "Move block down" })

    -- MULTI‑CURSOR FRIENDLY — works in block mode
    vim.keymap.set("x", "<A-Up>", "<Cmd>MoveBlockUp<CR>", { desc = "Move block up" })
    vim.keymap.set("x", "<A-Down>", "<Cmd>MoveBlockDown<CR>", { desc = "Move block down" })

    -- INSERT MODE — VSCode‑style Alt+Up / Alt+Down
    vim.keymap.set("i", "<A-Up>", function()
      local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(esc, "n", false)
      vim.cmd("MoveLineUp")
      vim.api.nvim_feedkeys("i", "n", false)
    end, { desc = "Move line up" })

    vim.keymap.set("i", "<A-Down>", function()
      local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(esc, "n", false)
      vim.cmd("MoveLineDown")
      vim.api.nvim_feedkeys("i", "n", false)
    end, { desc = "Move line down" })

    -- DUPLICATE LINE / BLOCK — Alt+Shift+Up / Alt+Shift+Down
    vim.keymap.set("n", "<A-S-Up>", function()
      local line = vim.api.nvim_get_current_line()
      vim.api.nvim_put({ line }, "l", true, true)
    end, { desc = "Duplicate line above" })

    vim.keymap.set("n", "<A-S-Down>", function()
      local line = vim.api.nvim_get_current_line()
      vim.api.nvim_put({ line }, "l", false, true)
    end, { desc = "Duplicate line below" })

    vim.keymap.set("v", "<A-S-Up>", function()
      vim.cmd("normal! y`>p")
    end, { desc = "Duplicate block above" })

    vim.keymap.set("v", "<A-S-Down>", function()
      vim.cmd("normal! y`<P")
    end, { desc = "Duplicate block below" })

    vim.keymap.set("i", "<A-S-Up>", function()
      local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(esc, "n", false)
      local line = vim.api.nvim_get_current_line()
      vim.api.nvim_put({ line }, "l", true, true)
      vim.api.nvim_feedkeys("i", "n", false)
    end, { desc = "Duplicate line above" })

    vim.keymap.set("i", "<A-S-Down>", function()
      local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(esc, "n", false)
      local line = vim.api.nvim_get_current_line()
      vim.api.nvim_put({ line }, "l", false, true)
      vim.api.nvim_feedkeys("i", "n", false)
    end, { desc = "Duplicate line below" })

    -- DELETE LINE — Ctrl+Shift+K (VSCode style)
    vim.keymap.set("n", "<C-S-k>", function()
      vim.cmd("normal! dd")
    end, { desc = "Delete line" })
    vim.keymap.set("v", "<C-S-k>", function()
      vim.cmd("normal! d")
    end, { desc = "Delete selection" })

    vim.keymap.set("i", "<C-S-k>", function()
      local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
      vim.api.nvim_feedkeys(esc, "n", false)
      vim.cmd("normal! dd")
      vim.api.nvim_feedkeys("i", "n", false)
    end, { desc = "Delete line" })

    -- CTRL+SHIFT+UP/DOWN — Move line/block across splits
    local function move_to_window(direction)
      local win = vim.api.nvim_get_current_win()
      local target = vim.fn.winnr(direction)

      if target == win then return end
      local mode = vim.fn.mode()
      local is_visual = mode == "v" or mode == "V" or mode == "\22"

      if is_visual then
        vim.cmd("normal! y")
        vim.cmd(direction .. "wincmd w")
        vim.cmd("normal! p")
        vim.cmd("normal! gv")
        vim.cmd("normal! d")
      else
        local line = vim.api.nvim_get_current_line()
        vim.cmd(direction .. "wincmd w")
        vim.api.nvim_put({ line }, "l", true, true)
        vim.cmd("normal! k")
        vim.cmd("normal! dd")
      end
    end

    vim.keymap.set({ "n", "v", "i" }, "<C-S-Up>", function()
      move_to_window("k")
    end, { desc = "Move line to window above" })

    vim.keymap.set({ "n", "v", "i" }, "<C-S-Down>", function()
      move_to_window("j")
    end, { desc = "Move line to window below" })
  end,
}
