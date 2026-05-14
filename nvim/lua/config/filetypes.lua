-- Custom filetype detection

vim.filetype.add({
  filename = {
    [".helmignore"] = "helm",
  },
  pattern = {
    -- Docker compose
    [".*docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
    [".*compose.*%.ya?ml"] = "yaml.docker-compose",
    -- Helm
    [".*templates/.*%.ya?ml"] = "helm",
    [".*templates/.*%.tpl"] = "helm",
    -- Helm values
    [".*values.*%.ya?ml"] = "yaml.helm-values",
    -- GitLab CI
    [".*%.gitlab%-ci.*%.ya?ml"] = "yaml.gitlab",
    -- JSON-LD
    [".*%.jsonld"] = "jsonld",
    -- HEEx (Elixir)
    [".*%.html%.heex"] = "html-eex",
  },
})
