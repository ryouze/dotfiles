#!/usr/bin/env zsh

# .zshrc is a configuration file for Zsh (Z shell). It is read only when the shell is interactive.
# This file is used to customize the behavior of the shell. It can be used to set shell options using the setopt and unsetopt commands.
# It can also be used to load shell modules, set history options, change the prompt, set up Zsh Line Editor (zle) and command completion, and so on.
# Variables that are only used in the interactive shell (like $LS_COLORS) are also set in this file.

# Configured by zsh-newuser-install
# HISTFILE is the name of the file in which command history is saved.
# HISTSIZE is the number of lines of command history to keep in memory.
# SAVEHIST is the number of lines of history to save in the history file.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# The following lines set Zsh-specific options:
# hist_expire_dups_first: When the history file size exceeds HISTSIZE, delete duplicates first.
# hist_ignore_dups: Do not enter command lines into the history list if they are duplicates of the previous event.
# hist_ignore_space: Do not save command lines that start with a space character in the history list.
# hist_verify: Whenever the user enters a line with history expansion, don't execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
# appendhistory: Append history lines from this session to the history file, instead of overwriting the file.
# notify: Report the status of background jobs immediately, not just before printing a prompt.
# correctall: Try to correct all words in the line. This may be slow.
# globdots: When performing filename generation, include filenames that start with a dot ('.').
# sharehistory: Share command history between all sessions.
# extendedglob: Enable extended globbing, which allows using regular expressions with *, e.g., 'ls *(.)' to list all regular files.
# nocaseglob: Enable case-insensitive globbing, e.g., 'ls *.txt' will match both 'file.txt' and 'FILE.TXT'.
# rcexpandparam: Enable array expansion with parameters, e.g., 'echo $arr' will output all elements of the array 'arr'.
# nocheckjobs: Disable the warning about running processes when exiting the shell. Without this option, if you try to exit the shell while jobs are running, you'll get a warning message.
# numericglobsort: Sort filenames numerically when it makes sense, e.g., 'ls file*' will list 'file1', 'file2', ..., 'file10' in that order, instead of 'file1', 'file10', 'file2'.
# nobeep: Disable the beep sound that the shell makes when it encounters an error.
# histignorealldups: If a new command is a duplicate of an older one, the older command is removed from the history.
# inc_append_history: Commands are added to the history immediately after they're executed, instead of waiting for the shell to exit.
setopt hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify appendhistory notify correctall globdots sharehistory extendedglob nocaseglob rcexpandparam nocheckjobs numericglobsort nobeep histignorealldups inc_append_history

# Color settings for ls command
export CLICOLOR=1
export LSCOLORS="BaFxGxDxCxegedabagaced"

# Customize the command prompt
PROMPT="%B%F{red}[%F{yellow}HIKARI:%~%F{red}] $ %b%F{white}"

# Add Homebrew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set default text editor
export EDITOR="nano"

# Add local binaries to PATH
export PATH="$HOME/.local/bin:$PATH"

# Load custom command-line aliases
source ~/.zsh_aliases

# Add additional Zsh completions to FPATH
FPATH=/opt/homebrew/share/zsh-completions:$FPATH
#fpath+=~/.zfunc  # Poetry (Python)

# Load and initialize the Zsh completion system, load the complist module for menu completion, and set the completion styles
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' completer _complete _approximate  # Use both exact and approximate completions
zstyle ':completion:*' max-errors 1 numeric  # Allow up to one error for approximate matches, if the input number is not an integer
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'  # Enable case-insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Use the LS_COLORS environment variable to colorize completions
zstyle ':completion:*' rehash true  # Automatically rehash before each completion, to pick up new executables in PATH
zstyle ':completion:*' accept-exact '*(N)'  # If there is an exact match for the completion, accept it immediately
zstyle ':completion:*' menu select=2  # Start menu completion when there are 2 or more matches

# Enable the completion system
# -d: Dump compinit's internal state to a cache file.
# -C: Use a cache file if available.
# That way, the cache file will be updated every time a new shell is started, without having to do it manually using "compinit -d".
compinit -dC

# Configure additional Zsh suggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#eval "$(register-python-argcomplete pipx)" # Pipx (Python)

# Add Zsh syntax highlighting
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root line cursor)
# The following line must be the last line to execute!
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
