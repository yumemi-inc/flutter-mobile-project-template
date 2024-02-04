#!/usr/bin/env bash

find_files() {
  find . -name "*.dart" -not \( -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gen.dart" -o -path "*/gen/*.dart" -o -path "./.dart_tool/*" \) -print0
}

files=()
while IFS= read -r -d $'\0' file; do
    files+=("$file")
done < <(find_files)

dart format -o none --set-exit-if-changed "${files[@]}"
