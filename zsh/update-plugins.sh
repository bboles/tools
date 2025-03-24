#!/usr/bin/env bash
PLUGIN_DIRS+=(
	"unixorn/fzf-zsh-plugin"
	"z-shell/zui"
	"z-shell/zbrowse"
)
BASE_DIR="$HOME/src/github.com"

cd "${BASE_DIR}" || (
	echo "Unable to access directory ~/src/github.com. Exiting."
	exit 1
)

for DIR in "${PLUGIN_DIRS[@]}"; do
	echo "Updating plugin ${DIR}..."
	cd "${DIR}" || echo "Unable to access dir ${DIR}."
	git pull
	# Go back to the same dir that we started from.
	cd "${BASE_DIR}"
done
