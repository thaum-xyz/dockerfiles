#!/bin/bash

REPO="quay.io/paulfantom/ankhmorpork"
HERE=$(pwd)

for r in */ ; do
	cd "$HERE/$r" || continue
	docker build --pull --tag "$REPO:${r::-1}" .
	docker push "$REPO:${r::-1}"
done
