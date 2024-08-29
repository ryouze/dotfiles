#!/bin/bash
# Aliases and functions for Git Bash on Windows

# Clear the terminal screen
alias cls="clear"

# Override the 'man' command to display help information
# Uses '--help' for commands if 'man' is not available in Git Bash
man() {
    if command -v "$1" &> /dev/null; then
        "$@" --help
    else
        echo "Command '$1' not found."
    fi
}

# Shortcut for opening Notepad++ using the default installation path
alias notepad++="/c/Program\ Files/Notepad++/notepad++.exe"

# Display the number of installed pip packages
alias pip-list='echo "Installed pip packages: $(pip list | wc -l)"'

# yt-dlp aliases
alias yt-mp3="yt-dlp --sponsorblock-remove all -x --audio-quality 192K --audio-format mp3 -o '~/Downloads/%(title)s.%(ext)s'"
alias yt-update="yt-dlp -U"

# Change directory if the current directory is the Windows system directory
# Check explicitly for the directory
if [[ "$PWD" == "/c/Windows/System32" ]]; then
    cd "$HOME"
fi
