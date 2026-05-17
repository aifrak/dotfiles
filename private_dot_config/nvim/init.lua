-- ~/.config/nvim/init.lua

-- =========================================================
--  Neovim IDE
--  Works on Linux, Windows, and WSL
-- =========================================================

-- Set <space> as leader before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

--  Load core config
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.filetypes")

--  Load plugins
require("lazy").setup("plugins", {
  change_detection = { notify = false },
  ui = {
    border = "rounded",
    size = { width = 0.85, height = 0.85 },
  },
  git = {
    filter = true,
  },
})
