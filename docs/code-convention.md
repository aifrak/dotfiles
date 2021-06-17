# Code convention

## run

### Function names

- Use `:` to separate scopes
- Use `-` (kebab-case) for scope names or purposes

```shellscript
function dev:dotnet-core:global-install {
  ...
}
```

In the above example, `dev` and `dotnet-core` are scopes and separated by `:`.
