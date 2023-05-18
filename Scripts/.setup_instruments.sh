#!/bin/bash

set -euo pipefail

ETC_DIR=".etc"
export UTILS_PATH="$ETC_DIR/utils"
export UTILS_BIN_PATH="$ETC_DIR/bin"

mkdir -p $UTILS_PATH
mkdir -p $UTILS_BIN_PATH

INSTRUMENTS_LIST_FILE=$1

required_instruments=$(cat $INSTRUMENTS_LIST_FILE | grep -v -E "^#.*")

ORIGINAL_IFS=$IFS
IFS='
'

for instrument in $required_instruments; do
	repository=$(echo $instrument | cut -w -f1)
	version=$(echo $instrument | cut -w -f2)
	execulable=$(echo $instrument | cut -w -f3)

	./$BASE_PATH/.install_instruments.sh $repository $version $execulable
done

IFS=$ORIGINAL_IFS
