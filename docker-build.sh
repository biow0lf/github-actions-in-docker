#!/bin/sh

docker build -t biow0lf/github-actions-in-docker:main . --no-cache --progress plain --build-arg COMMIT="$(git rev-parse HEAD)"
docker push biow0lf/github-actions-in-docker:main
