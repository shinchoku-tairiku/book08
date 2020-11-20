#!/bin/bash

IMAGE=amutake/satysfi:nightly

docker run --rm -v "$(pwd):/satysfi" "${IMAGE}" satysfi $@
