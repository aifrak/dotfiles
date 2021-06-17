#!/usr/bin/env bash

dockerfile_globs=(./Dockerfile*)

function dockerfile:help {
  cat <<EOF

  Dockerfile commands:
    dockerfile:format          Format all Dockerfiles
    dockerfile:lint            Lint all Dockerfiles
EOF
}

function dockerfile:lint {
  hadolint "${dockerfile_globs[@]}"
}

function dockerfile:format {
  shfmt -w "${dockerfile_globs[@]}"
}
