#!/usr/bin/env bash

dir=`pwd`
output=`dart run custom_lint` || result=$?

# ProblemMatcher does not support `INFO` level.
echo "$output" | sed -r -e "s#^  (.+):#  $dir/\1:#" -e "s/INFO/WARNING/g"


if [ -n "$result" ]; then
  exit 1
fi
