#!/usr/bin/env just --justfile

# renovate: datasource=docker depName=github/super-linter
super_linter_version := "slim-v4.9.2@sha256:63904379c7293d35915599bb9a27cb166431a4ef2891a960dec89adf26a3af67" # editorconfig-checker-disable-line

@_default:
  just --list

# Install project dependencies
install:
  just ansible/install

# Lint the project
lint *extra_args:
  docker run \
  -e RUN_LOCAL=true \
  -e DEFAULT_BRANCH=main \
  -e IGNORE_GENERATED_FILES=true \
  -e IGNORE_GITIGNORED_FILES=true \
  -e YAML_ERROR_ON_WARNING=true \
  {{extra_args}} \
  -v {{justfile_directory()}}:/tmp/lint \
  github/super-linter:{{super_linter_version}}

# Run the tests
test:
  just ansible/test

# Run the app
run:
  just ansible/run

# Clean generated files
clean:
  just ansible/clean
