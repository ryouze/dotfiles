#!/bin/bash

# Check if rosetta2 s installed on ARM64 Macbooks.
if [[ "`pkgutil --files com.apple.pkg.RosettaUpdateAuto`" == "" ]]; then
    echo "No, Rosetta 2 is NOT installed."
else
    echo "Yes, Rosetta 2 is installed."
fi
