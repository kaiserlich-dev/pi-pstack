#!/usr/bin/env bash
set -euo pipefail

repo=$(git rev-parse --show-toplevel)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

git clone -q --filter=blob:none https://github.com/cursor/plugins.git "$tmp/plugins"
git -C "$tmp/plugins" subtree split --prefix=pstack -b pstack-main >/dev/null
git -C "$repo" fetch -q "$tmp/plugins" pstack-main
git -C "$repo" merge --no-edit FETCH_HEAD

echo "Updated from cursor/plugins:pstack"
