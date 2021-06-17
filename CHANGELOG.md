<!-- markdownlint-configure-file
{
  "MD024": {
    "allow_different_nesting": true
  }
}
-->

# Changelog

## [v0.3.0](https://github.com/aifrak/dotfiles/releases/tag/v0.3.0)

### New

- Add `zinit`
- Install plugins and theme are via `zinit`
- Add `--asdf` and `--no-asdf`: `asdf` is installed by default

### BREAKING CHANGE

- Rename repository to `dotfiles`
- Remove `username` argument from `./install` and `./uninstall`: copied files
  will be located in the current user's `HOME` folder
- Remove `Oh My Zsh`
- Remove `--dockerfile`
- Remove `--node`
- Remove `--shellscript`
- Rename `--dependencies` into `--deps`

### Improvement

- `fzf` and `lsdeluxe` are installed via `asdf`

## [v0.2.1](https://github.com/aifrak/dotfiles/releases/tag/v0.2.1)

### Bug fix

- Improve documentation in README.md and `--help` option

## [v0.2.0](https://github.com/aifrak/dotfiles/releases/tag/v0.2.0)

### New

- Add `--node` option to install NodeJS and NPM

### Bug fix

- Fix ownership after extract archive

### Improvement

- Less verbose when extract archive

## [v0.1.2](https://github.com/aifrak/dotfiles/releases/tag/v0.1.2)

### Bug fix

- Fix ignored options after "--zsh"

## [v0.1.1](https://github.com/aifrak/dotfiles/releases/tag/v0.1.1)

### Bug fix

- Fix current directory to be relative
- Improve the install procedure in README.md

### BREAKING CHANGE

- Add "ca-certificates" package as requirements

## [v0.1.0](https://github.com/aifrak/dotfiles/releases/tag/v0.1.0)

### New

Initial release
