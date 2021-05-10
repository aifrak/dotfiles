#!/bin/sh

MAKEFILE_UTILS_DIR := ./scripts/makefile/makefile-utils

include $(MAKEFILE_UTILS_DIR)/shell-tests.mk

DOCKER_COMPOSE := docker-compose
SHELLCHECK_PATH := install uninstall

# Print list of commands
.PHONY: help
help: shell-help

.PHONY: tests
tests: tests-run tests-clean

.PHONY: tests-run
tests-run:
	@$(DOCKER_COMPOSE) --file docker-compose.test.yml up --build sut

.PHONY: tests-clean
tests-clean:
	@$(DOCKER_COMPOSE) --file docker-compose.test.yml down --volumes --remove-orphans --rmi all
