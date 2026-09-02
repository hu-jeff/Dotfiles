#!/bin/sh
set -e

cd "$(dirname "$0")"
git ls-files | grep -vE '^[^/]*\.sh$|^\.gitignore$' | while read -r f; do
  mkdir -p "$HOME/$(dirname "$f")"
  ln -sfn "$PWD/$f" "$HOME/$f"
done
