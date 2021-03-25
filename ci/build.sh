#! /usr/bin/env bash
set -euo pipefail

BUILDER=${BUILDER:-podman}


$BUILDER build \
    --tag webdev-toolbox \
    --file Containerfile \
    --build-arg UPDATE_AS_OF=$(date +%Y%m%d%H%M) \  # When this image is build for publication, we want to ensure we get the latest updates.
    .
