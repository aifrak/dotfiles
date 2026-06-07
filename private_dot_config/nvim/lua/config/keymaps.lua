-- Global Keymaps

local map = vim.keymap.set

-- Save / Quit / Select All / Undo / Redo
-- map({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save file" })
map({ "n", "i", "v" }, "<C-q>", "<Cmd>q<CR>", { desc = "Quit" })
map({ "n", "i", "v" }, "<C-a>", "ggVG", { desc = "Select all" })
map({ "n", "i", "v" }, "<C-z>", "<Cmd>undo<CR>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-y>", "<Cmd>redo<CR>", { desc = "Redo" })

vim.keymap.set("n", "<C-LeftMouse>", function()
  local pos = vim.fn.getmousepos()
  vim.api.nvim_win_set_cursor(pos.winid, { pos.line, pos.column - 1 })
  vim.cmd("normal gx")
end, { desc = "Open with Ctrl+Click" })

-- Show diagnostic on cursor
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
      border = "rounded",
    })
  end,
})

-- Remove built-in references search (superseded by snacks.vim)
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grx")
vim.keymap.del("n", "grt")

-- Fix for ESC and kitty keyboard to leave Search mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- CTRL+BACKSPACE and CTRL+SUPPR remove words
vim.keymap.set("i", "<C-BS>", "<C-W>", { desc = "Delete word before cursor" })
vim.keymap.set(
  "i",
  "<C-H>",
  "<C-W>",
  { desc = "Delete word before cursor (C-H fallback for terminal)" }
)
vim.keymap.set("i", "<C-Del>", "<C-O>dw", { desc = "Delete word after cursor" })

-- <Del> does not copy
vim.keymap.set({ "n", "v" }, "<Del>", '"_x')
