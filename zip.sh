#!/usr/bin/bash

# Run this script to create ZIP archives for each font subset

CURDIR=`dirname "$(realpath "$0")"`

cd "$CURDIR"

mkdir -p "$CURDIR/zip"
find -maxdepth 2 -type d -path './fonts/*' -exec bash -c 'SUBSET=`basename "{}"`; ZIP_FILE='"$CURDIR"'"/zip/${SUBSET}.zip"; cd fonts; zip -r "$ZIP_FILE" "$SUBSET"' \;