#!/usr/bin/env bash
set -euo pipefail

if ! command -v kubeseal 2>&1 >/dev/null; then
    echo "kubeseal is not installed"
    exit 1
fi

sealed_no=0

for path in secrets/*.yaml; do
  kubeseal -f $path -w resources/$(basename $path)
	((sealed_no++))
done

echo "Successfully sealed $sealed_no file(s)"