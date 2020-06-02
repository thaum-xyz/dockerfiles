#!/bin/bash

VERSION="v5.1.0"

export DOCKER_CLI_EXPERIMENTAL=enabled
docker manifest create -a "quay.io/paulfantom/ankhmorpork:oauth2-proxy" \
				  "quay.io/oauth2-proxy/oauth2-proxy:${VERSION}-amd64" \
				  "quay.io/oauth2-proxy/oauth2-proxy:${VERSION}-arm64" \
				  "quay.io/oauth2-proxy/oauth2-proxy:${VERSION}-armv6"

docker manifest annotate --arch "amd64" "quay.io/paulfantom/ankhmorpork:oauth2-proxy" "quay.io/oauth2-proxy/oauth2-proxy:${VERSION}-amd64"
docker manifest annotate --arch "arm64" "quay.io/paulfantom/ankhmorpork:oauth2-proxy" "quay.io/oauth2-proxy/oauth2-proxy:${VERSION}-arm64"
docker manifest annotate --arch "arm" "quay.io/paulfantom/ankhmorpork:oauth2-proxy" "quay.io/oauth2-proxy/oauth2-proxy:${VERSION}-armv6"

docker manifest push "quay.io/paulfantom/ankhmorpork:oauth2-proxy"
