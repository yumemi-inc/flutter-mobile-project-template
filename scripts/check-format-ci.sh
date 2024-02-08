#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

# terminate any remaining background jobs when the script exits.
trap '[ $(jobs | wc -l) -gt 0 ] && kill -SIGKILL $(jobs -p)' EXIT

# wait for all child processes to finish and return a non-zero status if any of them fail.
wait_for_all(){
  for pid in $@; do
    wait ${pid} || return 1
  done
}


files=()
while IFS= read -r -d $'\0' file; do
  files+=("$file")
done < <(find_custom_dart_files)

PIDS=()
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
  PIDS+=($!)
done

dart format -o none --set-exit-if-changed "${files[@]}"

wait_for_all ${PIDS[@]}
