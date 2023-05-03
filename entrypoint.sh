#!/bin/bash

set -e

# Add actions workspace to safe directories
git config --global --add safe.directory /github/workspace

git submodule init && git submodule update --recursive

hugo ${INPUT_HUGO_ARGS}
