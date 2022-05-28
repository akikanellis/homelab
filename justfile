#!/usr/bin/env just --justfile

# renovate: datasource=docker depName=github/super-linter
super_linter_version := "slim-v4.9.4@sha256:33ceb6b4e3144aabb48a3ae9d514dc69016ad52b85012cbc3f855e4af604f03b" # editorconfig-checker-disable-line

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
  -e ANSIBLE_COLLECTIONS_PATH=ansible/galaxy/collections:ansible/collections \
  -e ANSIBLE_ROLES_PATH=ansible/galaxy/roles:ansible/roles \
  -e FILTER_REGEX_EXCLUDE=.*ansible/.*vault\.yml \
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
