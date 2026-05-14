return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
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
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Install LSP
        ensure_installed = {
          -- Lua
          "lua_ls",
          -- Web (JS/TS, HTML, CSS)
          "ts_ls",
          "html",
          "cssls",
          "eslint",
          "tailwindcss",
          "superhtml",
          -- JSON
          "jsonls",
          -- YAML
          "yamlls",
          -- TOML
          "tombi",
          -- XML
          "lemminx",
          -- sh, bash, zsh
          "bashls",
          -- Dockerfile, docker-compose
          "docker_language_server",
          "docker_compose_language_service",
          -- SQL
          "postgres_lsp",
          -- Helm, terraform
          "helm_ls",
          -- Emmet
          "emmet_language_server",
          -- Markdown
          "marksman",
          "markdown_oxide",
          -- Typst
          "tinymist",
          -- Github Action
          "gh_actions_ls",
          -- Spell check and Grammar check
          "codebook",
          "typos_lsp",
          "vale_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "b0o/schemastore.nvim",
    },
    config = function()
      vim.lsp.enable({
        -- Elixir
        "expert",
        -- Lua
        "lua_ls",
        -- Web (JS/TS, HTML, CSS)
        "ts_ls",
        "html",
        "cssls",
        "eslint",
        "tailwindcss",
        "superhtml",
        -- JSON
        "jq-lsp",
        "jsonls",
        "jsonld-language-server",
        -- YAML
        "yamlls",
        -- TOML
        "tombi",
        -- XML
        "lemminx",
        -- sh, bash, zsh
        "bashls",
        -- Dockerfile, docker-compose
        "docker_language_server",
        "docker_compose_language_service",
        -- SQL
        "postgres_lsp",
        -- Helm, terraform
        "helm_ls",
        -- Emmet
        "emmet_language_server",
        -- Markdown
        "marksman",
        "markdown_oxide",
        "rumdl",
        -- Typst
        "tinymist",
        -- Github Actions
        "gh_actions_ls",
        -- Spell check and Grammar check
        "codebook",
        "typos-lsp",
        "vale_ls",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = vim.keymap.set
          local opts = { buffer = ev.buf }
          map("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
          map("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
          map("n", "<leader>ld", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
          map("n", "<leader>lD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))
          map("n", "<leader>li", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
          map("n", "<leader>lR", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
          map("n", "<leader>lh", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
          map("n", "<leader>ls", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature Help" }))
          map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, { desc = "Format" }))
        end,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("jq-lsp", {
        cmd = { "jq-lsp" },
        filetypes = { "jq" },
        root_markers = { ".git" },
      })

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            format = { enable = true },
            schemas = require("schemastore").yaml.schemas(),
            schemaStore = { enable = false },
            validate = true,
            completion = true,
          },
        },
      })

      vim.lsp.config("emmet_language_server", {
        init_options = {
          includeLanguages = {
            heex = "html",
          },
        },
      })

      vim.lsp.config("tailwindcss", {
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      })

      vim.lsp.config("typos-lsp", {
        init_options = {
          diagnosticSeverity = "Hint",
        },
      })

      vim.lsp.config("codebook", {
        cmd = { "codebook-lsp", "serve" },
        filetypes = {
          -- Default
          "c",
          "css",
          "gitcommit",
          "go",
          "haskell",
          "html",
          "java",
          "javascript",
          "javascriptreact",
          "lua",
          "markdown",
          "php",
          "python",
          "ruby",
          "rust",
          "swift",
          "toml",
          "text",
          "typescript",
          "typescriptreact",
          "zig",
          -- Extended
          "elixir",
          "typst",
          "yaml",
        },
      })

      -- aka jsonld-lsp
      vim.lsp.config("jsonld-language-server", {
        cmd = { "jsonld-language-server", "--stdio" },
        filetypes = { "jsonld" },
        root_markers = { ".git" },
      })

      -- Elixir Expert LSP
      vim.lsp.config("expert", {
        cmd = { "expert", "--stdio=true" },
        filetypes = { "elixir", "eelixir", "heex" },
        root_markers = { "mix.exs", ".git" },
        settings = {
          workspaceSymbols = {
            minQueryLength = 0,
          },
        },
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })
    end,
  }
}
