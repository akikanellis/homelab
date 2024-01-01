#!/usr/bin/env just --justfile

# renovate: datasource=docker depName=github/super-linter
super_linter_version := "slim-v5.0.0@sha256:25586f44c22b01c465fe00f939fd4d9c5222c71f647dee5f9d07413690067d3e" # editorconfig-checker-disable-line

@_default:
  just --list

# Install tools and dependencies
install: install-tools install-dependencies

# Install tools
install-tools:
  rtx install

# Install dependencies
install-dependencies:
  just ansible/install-dependencies

# Lint project
lint *extra_args:
  docker run \
  --env RUN_LOCAL=true \
  --env DEFAULT_BRANCH=main \
  --env IGNORE_GENERATED_FILES=true \
  --env IGNORE_GITIGNORED_FILES=true \
  --env YAML_ERROR_ON_WARNING=true \
  --env FILTER_REGEX_EXCLUDE=.*vault\.yml \
  --volume {{justfile_directory()}}:/tmp/lint \
  {{extra_args}} \
  github/super-linter:{{super_linter_version}}

# Run tests
test *extra_args:
  just ansible/test {{extra_args}}

# Create local instances
up *extra_args:
  just ansible/up {{extra_args}}

# Create and configure hosts locally
run *extra_args:
  just ansible/run {{extra_args}}

# Log in to a locally created host
login host:
  just ansible/login {{host}}

# Remove locally created hosts
down *extra_args:
  just ansible/down {{extra_args}}

# Clean generated files
clean:
  just ansible/clean
