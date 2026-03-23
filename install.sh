#!/usr/bin/env bash

set -euo pipefail

SCRIPT_NAME="verify-repo-status"
SOURCE_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/verify-repo-status.sh"
TARGET_LINK="/usr/local/bin/${SCRIPT_NAME}"

if [[ ! -f "${SOURCE_SCRIPT}" ]]; then
  echo "Error: source script not found at ${SOURCE_SCRIPT}"
  exit 1
fi

chmod +x "${SOURCE_SCRIPT}"

if [[ -L "${TARGET_LINK}" || -f "${TARGET_LINK}" ]]; then
  echo "Removing existing ${TARGET_LINK}"
  sudo rm -f "${TARGET_LINK}"
fi

sudo ln -s "${SOURCE_SCRIPT}" "${TARGET_LINK}"

echo "Installed successfully."
echo "Run it with: ${SCRIPT_NAME}"
