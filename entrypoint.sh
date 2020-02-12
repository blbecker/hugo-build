#!/bin/bash

set -e

export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
export GIT_SHA=$(git rev-parse --verify HEAD --short)

git submodule init && git submodule update --recursive

hugo
