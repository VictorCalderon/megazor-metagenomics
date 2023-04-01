#!/usr/bin/env bash

# Display all statements

if [[ $DEBUG_MG_ANALYZER ]]; then
	# Display all commands
	set -x
fi

# Exit on error
set -eo pipefail

# Check if user provided a name for this environment
if ! [[ -n "$1" ]]; then
	echo "[ERROR] You must supply a name for this environment."
	echo ""
	echo "Correct use:"
	echo "./build.sh <IMAGE_VERSION>"
	echo ""
	echo "Example:"
	echo "./build.sh v1"
	echo ""
	echo "Please run again with its corresponding image name."
	exit 1
fi

# Check if the provided name is already in use as a docker image
if [[ $(docker images -q $1 2>/dev/null) ]]; then
	echo "[ERROR] The provided name is already in use as a docker image."
	echo ""
	echo "Please run again with a different name."
	exit 1
fi

# # Check if user provided a name for this environment
# if [[ $PROJECT_NAME ]]; then
# 	echo "[ERROR] You must set environment variable PROJECT_NAME."
# 	exit 1
# fi

# # Check if user provided a name for this environment
# if [[ $MG_THREADS ]]; then
# 	echo "[ERROR] You must set environment variable MG_THREADS."
# 	exit 1
# fi

# Run container build
docker build -t mg-analyzer-$1 .
