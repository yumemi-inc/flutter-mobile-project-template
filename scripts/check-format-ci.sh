#!/usr/bin/env bash

files=()
while IFS= read -r -d $'\0' file; do
    files+=("$file")
done < <(find . -name "*.dart" -not \( -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gen.dart" -o -path "*/gen/*.dart" -o -path "./.dart_tool/*" \) -print0)

dart format -o none --set-exit-if-changed "${files[@]}"
