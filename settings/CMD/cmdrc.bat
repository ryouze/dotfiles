:: bash-like aliases for Windows Command Prompt

:: Do not print aliases to console when loading
@echo off

:: # Setup custom shell prompt (trailing space must be included!)
:: Info: https://www.hanselman.com/blog/a-better-prompt-for-cmdexe-or-cool-prompt-environment-variables-and-a-nice-transparent-multiprompt
set PROMPT=[$P] $$

:: # Setup Bash-like aliases
:: Info: https://superuser.com/questions/150244/command-aliases-in-command-prompt
:: ls - List directory contents
DOSKEY ls=DIR $*
:: cp - Copy files
DOSKEY cp=COPY $*
:: mv - Move, or rename directories
DOSKEY mv=MOVE $*
:: mv - Remove files
DOSKEY rm=del $*
:: cat - Read, create, or concatenate files
DOSKEY cat=TYPE $*
:: grep - search
DOSKEY grep=findstr $*
:: touch - Create files without overwriting their contents
DOSKEY touch=echo.>> $*
:: pwd - Print (current) working directory
DOSKEY pwd=echo %cd%
:: clear - Clear the screen
:: man - Print manual or get help for a command
DOSKEY man=$* /?
DOSKEY clear=CLS
:: history - List previous commands
DOSKEY history=DOSKEY /HISTORY
:: alias - List conents of this file
DOSKEY alias=type "%userprofile%\.cmdrc.bat"

:: # Setup yt-dlp commands
:: $ winget search yt-dlp
:: $ winget search ffmpeg
:: yt-download - Download a 192KB/S MP3 file to the Downloads directory with SponsorBlock (removes non-music parts & silences)
:: DOSKEY yt-download=yt-dlp.exe --sponsorblock-remove all -x --audio-quality 192K --audio-format mp3 -o "%userprofile%\Downloads\%%(title)s.%%(ext)s" $*
:: yt-download - Download a 192KB/S MP3 file to the Downloads directory without SponsorBlock (useful when API is down)
:: DOSKEY yt-download-no-sb=yt-dlp.exe -x --audio-quality 192K --audio-format mp3 -o "%userprofile%\Downloads\%%(title)s.%%(ext)s" $*

:: Clear screen once aliases are loaded
cls
