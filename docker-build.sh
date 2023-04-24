#!/bin/sh

# TODO: --build-arg COMMIT="$(git rev-parse HEAD)"
docker build -t biow0lf/github-actions-in-docker:main . --no-cache --progress plain
docker push biow0lf/github-actions-in-docker:main
