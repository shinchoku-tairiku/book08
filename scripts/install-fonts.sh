#!/usr/bin/env bash

set -eux -o pipefail

FONTS_FILE="$1"
ROOT_DIR="$2"

fonts_dir="$ROOT_DIR/dist/fonts"
mkdir -p "$fonts_dir"

tempdir="$(mktemp -d)"

cat "$FONTS_FILE" | while read filename url; do
    echo "$filename <- $url"
    wget -nv -O "$tempdir/$filename" "$url"
    unzip -o -d "$tempdir" "$tempdir/$filename"
done

echo "downloaded."

cp "$tempdir"/*.otf "$fonts_dir"/.

echo "done."
