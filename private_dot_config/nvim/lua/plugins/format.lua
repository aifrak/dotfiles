return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
    formatters_by_ft = {
      -- Elixir
      elixir = { "mix" },
      heex = { "mix" },
      eex = { "mix" },
      -- Lua
      lua = { "stylua" },
      -- sh, bash, zsh
      bash = { "shellharden", "shfmt", },
      sh = { "shellharden", "shfmt" },
      zsh = { "shellharden", "shfmt" },
      -- Makefile
      make = { "bake" }, -- "bake" instead of "mbake"
      -- Dockerfile
      dockerfile  = { "shfmt" },
      -- SQL
      sql = { "pg_format" },
      -- JSON
      json = { "prettierd" },
      jsonc = { "prettierd" },
      -- YAML
      yaml = { "prettierd" },
      -- TOML
      toml = { "tombi" },
      -- Web (JS/TS, HTML, CSS)
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      markdown = { "rumdl", "cbfmt" },
      -- Helm, terraform
      hcl = { "hcl" }, -- "bake" instead of "hclfmt"
      terraform = { "hcl" }, -- "bake" instead of "hclfmt"
      tf = { "hcl" },  -- "bake" instead of "hclfmt"
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    })
  end,
}
