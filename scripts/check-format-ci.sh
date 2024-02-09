#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

# terminate any remaining background jobs when the script exits.
trap '[ $(jobs | wc -l) -gt 0 ] && kill -SIGKILL $(jobs -p)' EXIT

# wait for all child processes to finish and return a non-zero status if any of them fail.
wait_for_all(){
  local st=0
  for pid in $@; do
    wait ${pid} || st=$?
  done
  return $st
}


files=()
while IFS= read -r -d $'\0' file; do
  files+=("$file")
done < <(find_custom_dart_files)

pids=()
for file in "${files[@]}"; do
  # limit jobs to 5
  if [ "$(jobs -r | wc -l)" -ge 5 ]; then
      wait "$(jobs -r -p | head -1)"
  fi

  (
    # Note: The script relies on the 'Nothing to fix!' output from 'dart fix --dry-run'.
    # This dependency might be an issue if the output format changes in future Dart versions.
    if ! dart fix --dry-run "$file" | grep -q "Nothing to fix!"; then
      echo "Fixes might be needed for $file"
      exit 1
    fi
  ) &
  pids+=($!)
done

if ! wait_for_all ${pids[@]}; then
  exit 1
fi

dart format -o none --set-exit-if-changed "${files[@]}"
