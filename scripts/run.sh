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
	echo "[ERROR] You must supply a version to run your environment."
	echo ""
	echo "Correct use:"
	echo "./run.sh <IMAGE_VERSION>"
	echo ""
	echo "Example:"
	echo "./run.sh v1"
	echo ""
	echo "Please run again with its corresponding image name."
	exit 1
fi

# Run container build
docker run -it mg-analyzer-$USER-$1 bash

# kraken2 assembly/final.contigs.fa --db /MP_Data/db_kraken2 --threads 12 --output kraken_output --classified-out kraken_classified --report kraken_report --use-names
