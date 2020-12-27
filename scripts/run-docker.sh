#!/bin/bash

IMAGE=amutake/satysfi:0.0.5-59-g32f2525-slim

docker run --rm -v "$(pwd):/satysfi" "${IMAGE}" satysfi $@
