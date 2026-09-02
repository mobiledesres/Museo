#!/usr/bin/bash

# Run this script to create ZIP archives for each font subset

CURDIR=`dirname "$(realpath "$0")"`
FONTS_DIR=$CURDIR/fonts
ZIP_DIR=$CURDIR/zip

cd "$CURDIR"

mkdir -p "$ZIP_DIR"

# Pack individual font subsets into separate ZIP archives
find -maxdepth 2 -type d -path './fonts/*' -exec bash -c 'SUBSET=`basename "{}"`; ZIP_FILE="'"$ZIP_DIR"'/${SUBSET}.zip"; cd "'"$FONTS_DIR"'"; zip -r "$ZIP_FILE" "$SUBSET"' \;

# Pack a whole ZIP
find "$FONTS_DIR" -maxdepth 1 -type d -name '*' -exec bash -c 'ZIP_FILE="'"$ZIP_DIR"'/Museo font family.zip"; cd "'"$FONTS_DIR"'"; zip -r "$ZIP_FILE" . ' \;