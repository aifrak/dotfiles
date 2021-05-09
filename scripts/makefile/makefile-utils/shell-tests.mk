#!/bin/sh

include $(MAKEFILE_UTILS_DIR)/makefile-utils.mk

SHELL := sh

DOCKER := docker

# Docker image for ShellCheck
SHELLCHECK := koalaman/shellcheck:v0.7.1
# Path of the project inside Docker container
SHELLCHECK_PATH := ./src/**.sh
# Path of the project on the host when ShellCheck
SHELLCHECK_HOST_DIR := ${PWD}

# Print list of commands
.PHONY: shell-help
shell-help:
	@echo ""
	@echo "Shell test commands:"
	@echo "  shell-lint:             Lint Shell scripts"

# Lint Shell scripts
.PHONY: shell-lint
shell-lint:
	@echo ""
	@echo "- Lint Shell scripts:"
	@echo ""
	@$(DOCKER) run --rm -v "${SHELLCHECK_HOST_DIR}:/mnt" ${SHELLCHECK} ${SHELLCHECK_PATH} \
		--shell=$(SHELL) --format=tty -x
	@echo ""
	@echo $(call print_success, "✔ Lint Shell scripts: OK")
