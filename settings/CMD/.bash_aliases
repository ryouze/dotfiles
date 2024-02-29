# .bashrc aliases for bash running on Windows (e.g., Git for Windows)

# Clear the terminal screen
alias cls='clear'

# Override the 'man' command to display help information
# This is a workaround for the 'man' command not working in Git Bash on Windows
man() { $@ "--help"; }

# Shortcut for opening Notepad++
alias notepad++='/c/Program\ Files/Notepad++/notepad++.exe'

# Display the number of installed pip packages
# alias piplist='pip list | echo "Installed pip packages: $(wc -l)"'

# yt-dlp aliases
# alias yt-mp3='~/Software/yt-dlp/yt-dlp.exe --sponsorblock-remove all -x --audio-quality 192K --audio-format mp3 -o "~/Downloads/%(title)s.%(ext)s"'
# alias yt-update='~/Software/yt-dlp/yt-dlp.exe -U'

# If the current directory is the Windows system directory, change to the home directory, Windows Terminal opens it by default afaik
if [[ $PWD -ef "/c/Windows/system32" ]]; then
    cd $HOME
fi
