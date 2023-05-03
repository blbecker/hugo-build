#!/bin/bash

set -e

git submodule init && git submodule update --recursive

hugo ${INPUT_HUGO_ARGS}
