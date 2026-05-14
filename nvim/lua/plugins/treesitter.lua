-- Treesitter (with special mise config)
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').setup {
      -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
      install_dir = vim.fn.stdpath('data') .. '/site'
    }

    require("nvim-treesitter").install({
      -- Lua
      "lua",
      "luadoc",
      -- Neovim
      "vim",
      "vimdoc",
      -- Web (JS/TS, HTML, CSS)
      "javascript",
      "typescript",
      "jsx",
      "tsx",
      "html",
      "css",
      "scss",
      "http",
      "graphql",
      "robots_txt",
      -- JSON
      "jq",
      "json",
      "json5",
      -- YAML
      "yaml",
      -- TOML
      "toml",
      -- sh, bash, zsh
      "bash",
      "zsh",
      -- Powershell
      "powershell",
      -- Dockerfile
      "dockerfile",
      -- Go
      "go",
      -- Rust
      "rust",
      -- Python
      "python",
      "requirements",
      -- C#
      "c_sharp",
      -- Elixir / BEAM
      "elixir",
      "heex",
      "eex",
      "erlang",
      "gleam",
      -- SQL
      "sql",
      -- Markdown
      "markdown",
      "markdown_inline",
      -- Typst
      "typst",
      -- Helm, Terraform
      "hcl",
      "terraform",
      "helm",
      -- Git
      "diff",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      -- Makefile
      "make",
      -- Diagrams
      "mermaid",
      -- General
      "editorconfig",
      "ssh_config",
      "gpg",
      "ini",
      "csv",
      "xml",
      "regex",
      "comment",
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "*" },
      callback = function()
        local ft = vim.bo.filetype
        if not ft or ft == "" then return end

        -- Check if Treesitter has a parser for this filetype
        local ok = pcall(vim.treesitter.language.inspect, ft)
        if not ok then return end

        -- Highlighting
        vim.treesitter.start()

        -- Indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- Folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
    })

    -- Add custom predicate "is-mise?"
    require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
      local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
      local filename = vim.fn.fnamemodify(filepath, ":t")
      return string.match(filename, ".*mise.*%.toml$") ~= nil
    end, { force = true, all = false })
  end,
}
