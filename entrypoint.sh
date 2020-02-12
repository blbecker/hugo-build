#!/bin/bash

set -e

export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
export GIT_SHA=$(git rev-parse --verify HEAD --short)

echo -e "GIT_BRANCH=${GIT_BRANCH}\nGIT_SHA=${GIT_SHA}"

git submodule init && git submodule update --recursive

hugo
