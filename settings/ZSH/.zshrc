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
# appendhistory: Append history lines from this session to the history file.
# notify: Report the status of background jobs immediately, not just before printing a prompt.
# correctall: Try to correct all words in the line. This may be slow.
# globdots: When performing filename generation, include filenames that start with a dot ('.').
# sharehistory: Share command history between all sessions.
setopt hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify appendhistory notify correctall globdots sharehistory
unsetopt beep

# Color settings for ls command
export CLICOLOR=1
export LSCOLORS="BaFxGxDxCxegedabagaced"

# Customize the command prompt
PROMPT="%B%F{red}[%F{yellow}HIKARI:%~%F{red}] $ %b%F{white}"

# Add Homebrew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set default text editor
export EDITOR="nano"

# Load custom command-line aliases
source ~/.zsh_aliases

# Add additional Zsh completions to FPATH
FPATH=/opt/homebrew/share/zsh-completions:$FPATH

# Enable highlighting of menu completion items
zstyle ':completion:*' menu select

# Load and initialize the Zsh completion system
autoload -Uz compinit
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=2
zmodload zsh/complist
compinit -C

# Configure additional Zsh suggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add Zsh syntax highlighting
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root line cursor)
# The following line must be the last line to execute!
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
