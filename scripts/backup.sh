#!/bin/bash
set -euo pipefail

## --- Base --- ##
# Getting path of this script file:
_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
_PROJECT_DIR="$(cd "${_SCRIPT_DIR}/.." >/dev/null 2>&1 && pwd)"
cd "${_PROJECT_DIR}" || exit 2

# Loading base script:
# shellcheck disable=SC1091
source "${_SCRIPT_DIR}/base.sh"

# Loading .env file:
if [ -f ".env" ]; then
	# shellcheck disable=SC1091
	source .env
fi
## --- Base --- ##


## --- Variables --- ##
# Load from envrionment variables:
BACKUPS_DIR="${BACKUPS_DIR:-./volumes/backups}"
VERSION_FILENAME=${VERSION_FILENAME:-version.txt}
## --- Variables --- ##


## --- Main --- ##
main()
{
	echoInfo "Creating backups of 'stack.template'..."
	if [ ! -d "${BACKUPS_DIR}" ]; then
		mkdir -pv "${BACKUPS_DIR}" || exit 2
	fi

	_old_version="0.0.0-000000"
	if [ -n "${VERSION_FILENAME}" ] && [ -f "${VERSION_FILENAME}" ]; then
		_old_version=$(cat "${VERSION_FILENAME}") || exit 2
	fi

	sudo tar -czpvf "${BACKUPS_DIR}/stack.template.v${_old_version}.$(date -u '+%y%m%d_%H%M%S').tar.gz" -C ./volumes ./storage || exit 2
	echoOk "Done."
}

main "${@:-}"
## --- Main --- ##
