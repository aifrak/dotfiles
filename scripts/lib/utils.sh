#!/usr/bin/env bash

# Colors
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
normal="\e[0m"

function alert_die {
  local error="${1}"

  print_new_line
  alert "Error: $error"
  die
}

function print {
  echo -e "${*}"
}

function print_error {
  print >&2 "${*}"
}

function print_new_line {
  print ""
}

# Prints a green success message.
function success {
  print "${green}${*}${normal}"
}

# Prints a yellow warning message.
function warning {
  print "${yellow}${*}${normal}"
}

# Prints a red error message.
function alert {
  print_error "${red}${*}${normal}"
}

# Wrapper for "exit" when error.
function die {
  exit 1
}
