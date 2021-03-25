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

echo ${CR_PASS} | docker login "${CR_REGISTRY}" "${CR_USER}" --password-stdin

IMAGE_ID="${CR_REGISTRY}/${CR_USER}/webdev-toolkit"
VERSION=$(date %Y%m%d%H%M)
echo "IMAGE_ID=${IMAGE_ID}"
echo "VERSION=${VERSION}"

docker tag webdev-toolkit $IMAGE_ID:$VERSION 
docker tag webdev-toolkit $IMAGE_ID:latest

docker push $IMAGE_ID:$VERSION
docker push $IMAGE_ID:latest
