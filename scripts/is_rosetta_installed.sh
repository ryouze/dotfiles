#!/bin/bash

# Checks if rosetta2 s installed on ARM64 Macbooks.
if [[ "`pkgutil --files com.apple.pkg.RosettaUpdateAuto`" == "" ]]; then
    echo 'answer: no, rosetta is NOT installed'
else
    echo 'answer: yes, rosetta is installed'
fi
