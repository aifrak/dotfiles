-- Multi-cursor (VSCode-style)

return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_mouse_mappings = 1
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>", -- select word under cursor (like VSCode Ctrl+D)
      ["Find Subword Under"] = "<C-d>",
      ["Select All"] = "<C-S-l>",
      ["Add Cursor At Pos"] = "<M-LeftMouse>", -- Alt+click to add cursor
      ["Goto Prev"] = "<C-[>",
      ["Goto Next"] = "<C-]>",
    }
  end,
}
