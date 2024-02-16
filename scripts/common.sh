#!/usr/bin/env bash

# Retrieve a list of Dart files excluding automatically generated files and those in the /.dart_tool/ directory.
function find_custom_dart_files() {
      find . -name "*.dart" -not \( \
        -name "*.freezed.dart" -o \
        -name "*.g.dart" -o \
        -name "*.gen.dart" -o \
        -path "*/gen/*.dart" -o \
        -path "./.dart_tool/*" \
    \) -print0
}
