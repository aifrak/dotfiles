return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- Lua
      lua = { "selene" },
      -- sh, bash, zsh
      sh = { "shellharden", "shellcheck" },
      bash = { "shellharden", "shellcheck" },
      zsh = { "shellharden", "shellcheck" },
      -- Makefile
      make = { "checkmake", "mbake" },
      -- Dockerfile
      dockerfile = { "hadolint" },
      -- YAML
      yaml = { "yamllint", "kube_linter" },
      ["yaml.github"] = { "actionlint" },
      -- Markdown
      markdown = { "markdownlint-cli2", "cspell" },
      -- HTML
      html = { "markuplint" },
      -- SQL
      sql = { "sqlfluff" },
      -- Git
      gitcommit = { "gitlint", "commitlint" },
      -- dotenv
      dotenv = { "dotenv-linter" },
      -- Typst
      typst = { "cspell" },
      -- TXT
      text = { "cspell" },
      -- editorconfig
      ["*"] = { "editorconfig_checker" },
    }

    -- Run linters on save, write to buffer or when leave insert mode
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath:match("k8s/") or filepath:match("kubernetes/") or filepath:match("manifests/") then
          lint.try_lint("kube_linter")
        else
          lint.try_lint()
        end
      end,
    })

    -- Custom linter for cspell
    -- lint.linters.cspell = {
    --   cmd = "cspell",
    --   stdin = true,
    --   args = {
    --     "lint",
    --     "--stdin",
    --     "--stdin-filename",
    --     "%filepath",
    --     "--no-progress",
    --     "--no-summary",
    --   },
    --   ignore_exitcode = true,
    --   parser = function(output)
    --     local diagnostics = {}
    --     for line in output:gmatch("[^\r\n]+") do
    --       local file, lnum, col, msg = line:match("([^:]+):(%d+):(%d+)%s+(.*)")
    --       if lnum then
    --         table.insert(diagnostics, {
    --           lnum = tonumber(lnum) - 1,
    --           col = tonumber(col) - 1,
    --           message = msg,
    --           severity = vim.diagnostic.severity.WARN,
    --           source = "cspell",
    --         })
    --       end
    --     end
    --     return diagnostics
    --   end,
    -- }

    -- Custom linter for mbake
    lint.linters.mbake = {
      cmd = "mbake",
      args = { "validate", "$FILENAME" },
      stdin = false,
      ignore_exitcode = true,
      parser = require("lint.parser").from_pattern(
        "(%d+):(%d+): (.+)",
        { "lnum", "col", "message" },
        nil,
        { source = "mbake" }
      ),
    }

    -- Custom linter for shellharden
    lint.linters.shellharden = {
      cmd = "shellharden",
      stdin = true,
      args = { "--check", "--diff", "-" },
      ignore_exitcode = true,
      parser = function(output)
        local diagnostics = {}
        for line in output:gmatch("[^\r\n]+") do
          if line:match("^warning:") then
            table.insert(diagnostics, {
              lnum = 0,
              col = 0,
              message = line,
              severity = vim.diagnostic.severity.WARN,
              source = "shellharden",
            })
          end
        end
        return diagnostics
      end,
    }

    -- Custom linter for editorconfig-checker
    lint.linters.editorconfig_checker = {
      cmd = "editorconfig-checker",
      args = { "-f", "gcc", "$FILENAME" },
      stdin = false,
      ignore_exitcode = true,
      parser = require("lint.parser").from_pattern(
        "([^:]+):(%d+):(%d+): (.+)",
        { "file", "lnum", "col", "message" },
        nil,
        { source = "editorconfig-checker" }
      ),
    }

    -- Custom linter for kube-linter
    lint.linters.kube_linter = {
      cmd = "kube-linter",
      args = { "lint", "--format", "plain", "$FILENAME" },
      stdin = false,
      ignore_exitcode = true,
      parser = require("lint.parser").from_pattern(
        "(.+): (.+)",
        { "file", "message" },
        nil,
        { source = "kube-linter" }
      ),
    }

    -- Custom linter for commitlint
    lint.linters.commitlint = {
      cmd = "commitlint",
      args = { "--format", "commitlint-format-json", "--from", "HEAD" },
      stdin = true,
      ignore_exitcode = true,
      parser = function(output)
        local diagnostics = {}
        local ok, data = pcall(vim.json.decode, output)
        if ok and data then
          for _, result in ipairs(data) do
            table.insert(diagnostics, {
              lnum = 0,
              col = 0,
              message = result.message,
              severity = result.level == 2 and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
              source = "commitlint",
            })
          end
        end
        return diagnostics
      end,
    }
  end,
}
