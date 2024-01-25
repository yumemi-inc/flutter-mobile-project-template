#!/usr/bin/env bash

files=()
while IFS= read -r -d $'\0' file; do
    files+=("$file")
done < <(find . -name "*.dart" -not \( -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gen.dart" -o -path "*/gen/*.dart" -o -path "./.dart_tool/*" \) -print0)


for file in "${files[@]}"; do
  # limit jobs to 5
  if [ "$(jobs -r | wc -l)" -ge 5 ]; then
      wait "$(jobs -r -p | head -1)"
  fi
  dart fix --apply "$file" &
done
wait

dart format "${files[@]}"
