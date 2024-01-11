#!/usr/bin/env bash

files=$(find . -name "*.dart" -not \( -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gen.dart" \))
for file in $files; do
# limit jobs to 5
if [ "$(jobs -r | wc -l)" -ge 5 ]; then
    wait "$(jobs -r -p | head -1)"
fi
dart fix --apply "$file" &
done
wait

dart format "$file"
