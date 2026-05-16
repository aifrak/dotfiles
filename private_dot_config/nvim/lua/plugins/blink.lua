return {
  "saghen/blink.cmp",
  branch = "main",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
  },
  build = function()
    -- Temporary fix for Windows to build correctly.
    -- Error starts with "Failed to build blink.cmp fuzzy matcher library:"
    -- Error about "libblink_cmp_fuzzy.dll"
    if vim.fn.has("win32") then
      local data = vim.fn.stdpath("data")
      local blink_dir = data .. "/lazy/blink.cmp"

      -- Build the DLL
      local result = vim.fn.system("cargo build --release --manifest-path " .. blink_dir .. "/Cargo.toml")

      local source = blink_dir .. "/target/release/blink_cmp_fuzzy.dll"
      local lib_dir = data .. "/site/lib/"
      vim.fn.mkdir(lib_dir, "p")

      -- Remove old copies
      for _, f in ipairs(vim.fn.glob(lib_dir .. "libblink_cmp_fuzzy.dll.*", false, true)) do
        vim.fn.delete(f)
      end

      -- Copy to required folder
      local commit_hash = vim.fn.system("git -C " .. blink_dir .. " rev-parse --short HEAD"):gsub("\n", "")
      vim.loop.fs_copyfile(source, lib_dir .. "libblink_cmp_fuzzy.dll." .. commit_hash)
    else
      -- Normal recommended code
      require("blink.cmp").build():wait(60000)
    end
  end,
  -- build = "cargo build --release",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      ghost_text = { enabled = true },
      documentation = { auto_show = true }
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "cmdline", "codecompanion" },
      providers = {
        codecompanion = {
          name = "CodeCompanion",
          module = "codecompanion.providers.completion.blink",
        },
      },
    },
    term = {
      enabled = true,
      completion = {
        menu = { auto_show = true },
        ghost_text = { enabled = true },
      }
    },
  },
  opts_extend = { "sources.default" },
}
