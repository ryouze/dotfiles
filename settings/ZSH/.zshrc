#!/usr/bin/env zsh

# .zshrc is a configuration file for Zsh (Z shell). It is read only when the shell is interactive.
# This file is used to customize the behavior of the shell. It can be used to set shell options using the setopt and unsetopt commands.
# It can also be used to load shell modules, set history options, change the prompt, set up Zsh Line Editor (zle) and command completion, and so on.
# Variables that are only used in the interactive shell (like $LS_COLORS) are also set in this file.

# The following lines are configured by zsh-newuser-install
# HISTFILE is the name of the file in which command history is saved.
# HISTSIZE is the number of lines of command history to keep in memory.
# SAVEHIST is the number of lines of history to save in the history file.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# zstyle is a command to define styles. Here it is used to set the filename for compinstall to '$HOME/.zshrc'.
# This is useful when you run compinstall again, as it lets compinstall find where it has written out zstyle statements for you last time.
# This way, you can run compinstall again to update them.
zstyle ':compinstall' filename '$HOME/.zshrc'

# The following lines set Zsh-specific options:
# hist_expire_dups_first: When the history file size exceeds HISTSIZE, delete duplicates first.
# hist_ignore_dups: Do not enter command lines into the history list if they are duplicates of the previous event.
# hist_ignore_space: Do not save command lines that start with a space character in the history list.
# hist_verify: Whenever the user enters a line with history expansion, don't execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
# appendhistory: Append history lines from this session to the history file.
# notify: Report the status of background jobs immediately, not just before printing a prompt.
# correctall: Try to correct all words in the line. This may be slow.
# globdots: When performing filename generation, include filenames that start with a dot ('.').
# autocd: Change to a directory just by typing its name, without needing to type 'cd'.
# sharehistory: Share command history between all sessions.
setopt hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify appendhistory notify correctall globdots autocd sharehistory

# beep: If set, the shell will not beep when an error occurs.
unsetopt beep

# CLICOLOR and LSCOLORS are used to control the colors of the file listings output by the ls command.
export CLICOLOR=1
export LSCOLORS="BaFxGxDxCxegedabagaced"

# PROMPT is used to customize the command prompt. Here it is set to display 'HIKARI' and the current working directory.
PROMPT="%B%F{red}[%F{yellow}HIKARI:%~%F{red}] $ %b%F{white}"

# Homebrew is a package manager for macOS. The following line adds Homebrew to the PATH.
eval "$(/opt/homebrew/bin/brew shellenv)"

# The EDITOR environment variable is used to specify the default text editor. Here it is set to nano.
export EDITOR="nano"

# The following line loads custom command-line aliases from the file .zsh_aliases.
source ~/.zsh_aliases

# The FPATH variable is used to specify directories for the shell to search for function definitions. Here it is set to include the directory for Zsh completions.
FPATH=/opt/homebrew/share/zsh-completions:$FPATH

# The following line enables highlighting of menu completion items when navigating with the arrow keys.
zstyle ':completion:*' menu select

# The following lines load and initialize the Zsh completion system.
# On slow systems, checking the cached .zcompdump file to see if it must be regenerated can add a noticeable delay to Zsh startup.
autoload -Uz compinit
compinit

# The following lines configure Zsh suggestions:
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE sets the maximum number of characters in the command buffer for which suggestions will be shown.
# ZSH_AUTOSUGGEST_STRATEGY sets the suggestion strategy. Here it is set to use both history and completion.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# The following lines add Zsh syntax highlighting to the PATH, set the maximum length for highlighting, and add extra highlighters.
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
# The line below must be last command to execute!
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
