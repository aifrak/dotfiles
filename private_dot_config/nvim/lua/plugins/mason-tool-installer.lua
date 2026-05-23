return {
  {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        -- Install Linters and Formatters and LSP without easy-install
        ensure_installed = {
          -- Lua
          "stylua",
          "selene",
          -- sh, bash, zsh
          "shfmt",
          "shellcheck",
          "shellharden",
          -- Kubernetes
          "kube-linter",
          -- JSON
          "jq",
          "jq-lsp",
          "jsonld-lsp",
          -- YAML
          "yamllint",
          -- Helm, terraform
          "hclfmt",
          -- Dockerfile
          "hadolint",
          -- SQL
          "pgformatter",
          "sqlfluff",
          -- dotenv
          "dotenv-linter",
          -- Editorconfig
          "editorconfig-checker",
          -- Git commits
          "commitlint",
          "gitlint",
          -- HTML
          "markuplint",
          -- Makefile
          "checkmake",
          "mbake",
          -- Markdown
          "markdownlint-cli2",
          "cbfmt",
          "rumdl",
          -- Spell check and Grammar check
          "typos-lsp",
          "vale",
          "cspell",
          -- GitHub Actions
          "actionlint",
          -- General
          "prettierd",
          -- snacks.nvim (image)
          "mmdc", -- mermaid
          "tectonic", -- LaTeX math expressions
        },
      })
    end,
  },
}
