#!/bin/bash

IMAGE=amutake/satysfi:0.0.5-slim

docker run --rm -v "$(pwd):/satysfi" "${IMAGE}" satysfi $@
