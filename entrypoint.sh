#!/bin/bash
set -eu

cd "${HOME}" || exit 1
. $HOME/.bashrc

if [[ -v HF_HUB_TOKEN ]]; then
  echo "Logging into huggingface..."
  hf auth login --token $HF_HUB_TOKEN --add-to-git-credential
fi

echo "Sleeping..."

exec tail -f /dev/null
