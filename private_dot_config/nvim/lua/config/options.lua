--  Neovim Core Options (Linux, Windows, WSL compatible)

local opt = vim.opt
local g = vim.g

-- Disable other providers
g.loaded_node_provider = 0
g.loaded_perl_provider  = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

--  General
opt.modeline = false -- avoid vulnerability
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.hidden = true
opt.updatetime = 200
opt.timeoutlen = 400
opt.undofile = true

--  UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
-- white cursor, enable mode shapes, "Cursor" highlight
opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50-Cursor"
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
opt.laststatus = 3
opt.cmdheight = 0

-- Smooth scrolling
opt.mouse = "a"
opt.mousemoveevent = true

--  Tabs & Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.autoindent = true

--  Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Diagnostics
vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
})

-- Session (recommended by auto-session.nvim)
vim.o.sessionoptions = "buffers,curdir,help,globals,skiprtp,localoptions"

--  Clipboard (Linux, Windows, WSL)

-- Windows & Linux auto-detect system clipboard
opt.clipboard = "unnamedplus"

-- WSL clipboard support
if vim.fn.has("wsl") == 1 then
  local clip = "/mnt/c/Windows/System32/clip.exe"
  if vim.fn.executable(clip) == 1 then
    g.clipboard = {
      name = "WslClipboard",
      copy = {
        ["+"] = clip,
        ["*"] = clip,
      },
      paste = {
        ["+"] = "powershell.exe -NoProfile -Command Get-Clipboard",
        ["*"] = "powershell.exe -NoProfile -Command Get-Clipboard",
      },
      cache_enabled = 0,
    }
  end
end

--  Performance
opt.lazyredraw = false -- false because of Noice, Telescope, ...
opt.synmaxcol = 300
opt.completeopt = { "menu", "menuone", "noselect" }

--  File Navigation
opt.path:append("**")
opt.wildmenu = true
opt.wildmode = "longest:full,full"

--  Folding (Treesitter will override)
opt.foldmethod = "manual"
opt.foldlevel = 99

--  Disable built-in Vim plugins (legacy, slow, or conflicting)
--
--  WHY WE DO THIS:
--  Neovim/Vim automatically loads several old built-in plugins.
--  If a global variable named `loaded_<plugin>` is set to 1,
--  Neovim SKIPS loading that plugin.
--
--  Example:
--      vim.g.loaded_netrw = 1
--  prevents the old netrw file explorer from loading.
--
--  We disable these because:
--    • They are outdated or unmaintained
--    • They slow down startup
--    • They conflict with modern plugins (neo-tree, telescope, etc.)
--    • Your setup replaces all of them with better alternatives
--
--  This is standard practice in modern Neovim configs.

local disabled_builtins = {
  -- Old archive handlers (replaced by external tools)
  "gzip",            -- Handles .gz files (slow, unnecessary)
  "zip",             -- Handles .zip files
  "zipPlugin",       -- Zip plugin support
  "tar",             -- Handles .tar files
  "tarPlugin",       -- Tar plugin support

  -- Old plugin/package systems (replaced by lazy.nvim)
  "getscript",       -- Legacy plugin downloader
  "getscriptPlugin", -- Legacy plugin downloader
  "vimball",         -- Old Vim package format
  "vimballPlugin",   -- Old Vim package format

  -- Rarely used legacy features
  "2html_plugin",    -- Converts syntax-highlighted buffers to HTML
  "logipat",         -- Legacy regex helper
  "rrhelper",        -- Remote debugging helper (obsolete)

  -- Netrw (old file explorer, conflicts with neo-tree/oil.nvim)
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
}

--  HOW THIS WORKS:
--  Setting g.loaded_<plugin> = 1 tells Neovim:
--      "This plugin is already loaded — skip it."
--
--  We loop through the list above and disable each one.
for _, plugin in ipairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end
