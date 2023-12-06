#/bin/bash

set -e
set -x

REGISTRY_BASE_ACCOUNT=docker.io/rpolnx
PROJECT_REPONAME=api-flask
IMAGE_TAG=dev
CACHE_TAG=dev

export DOCKER_BUILDKIT=1

if [ "$IMAGE_TAG" != "main" ]; then
    export CACHE_TAG=$IMAGE_TAG
else
    export CACHE_TAG=dev
fi

docker build --progress=plain --target builder \
            --cache-from $REGISTRY_BASE_ACCOUNT/$PROJECT_REPONAME:builder \
            -f final.dockerfile \
            -t $REGISTRY_BASE_ACCOUNT/$PROJECT_REPONAME:$IMAGE_TAG \
            --build-arg BUILDKIT_INLINE_CACHE=1 .

docker build --progress=plain \
            --cache-from $REGISTRY_BASE_ACCOUNT/$PROJECT_REPONAME:builder \
            --cache-from $REGISTRY_BASE_ACCOUNT/$PROJECT_REPONAME:$CACHE_TAG \
            -f final.dockerfile \
            -t $REGISTRY_BASE_ACCOUNT/$PROJECT_REPONAME:$IMAGE_TAG \
            --build-arg BUILDKIT_INLINE_CACHE=1 .
