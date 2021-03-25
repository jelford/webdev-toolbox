#! /usr/bin/env bash
set -euo pipefail

BUILDER=${BUILDER:-podman}

$BUILDER build --tag webdev-toolbox --file Containerfile .
