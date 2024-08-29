#!/bin/bash

# Function to check if Rosetta 2 is installed on ARM64 Macbooks
is_rosetta_installed() {
    pkgutil --files com.apple.pkg.RosettaUpdateAuto &>/dev/null
}

# Check and print the status of Rosetta 2 installation
if is_rosetta_installed; then
    echo "Yes, Rosetta 2 is installed."
else
    echo "No, Rosetta 2 is NOT installed."
fi
