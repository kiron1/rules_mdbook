$!/usr/bin/env bash

echo ===
echo args $0 $*
echo ===
find .
echo ===
find . -type l -exec ls -l {} +
exit 1
