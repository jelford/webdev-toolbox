#! /usr/bin/env bash
set -euo pipefail

if [[ ! -v CR_USER ]]; then
    echo >&2 "Container Registry User must be set via CR_USER environment variable"
    exit 1
fi


if [[ ! -v CR_PASS ]]; then
    echo >&2 "Container Registry Password must be set via CR_PASS environment variable"
    exit 1
fi

if [[ ! -v CR_REGISTRY ]]; then
    echo >&2 "Container Registry must be set via CR_REGISTRY"
    exit 1
fi

BUILDER=${BUILDER:-podman}

echo ${CR_PASS} | $BUILDER login -u "${CR_USER}" --password-stdin  "${CR_REGISTRY}"

IMAGE_ID="${CR_REGISTRY}/${CR_USER}/webdev-toolkit"
VERSION=$(date +%Y%m%d%H%M)
echo "IMAGE_ID=${IMAGE_ID}"
echo "VERSION=${VERSION}"

$BUILDER tag webdev-toolkit $IMAGE_ID:$VERSION 
$BUILDER tag webdev-toolkit $IMAGE_ID:latest

$BUILDER push $IMAGE_ID:$VERSION
$BUILDER push $IMAGE_ID:latest
