#!/usr/bin/env bash

shell_scripts_globs=(
  install
  uninstall
  run
  scripts/**/*.sh
)

function shell:help {
  cat <<EOF

  Shell commands:
    shell:format               Format Shell scripts
    shell:lint                 Lint Shell scripts
EOF
}

function shell:lint {
  shellcheck "${shell_scripts_globs[@]}" -x
}

function shell:format {
  shfmt -w "${shell_scripts_globs[@]}"
}
