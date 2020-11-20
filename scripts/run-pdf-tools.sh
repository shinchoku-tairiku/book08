#!/bin/bash

IMAGE=amutake/pdf-tools

docker run --rm -v "$(pwd):/workdir" "${IMAGE}" $@
