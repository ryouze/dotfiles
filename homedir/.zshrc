#!/usr/bin/env zsh
# .zshrc is for interactive shells (read only if interactive).
# You set options for the interactive shell there with the setopt and unsetopt commands.
# You can also load shell modules, set your history options, change your prompt, set up zle and completion, et cetera.
# You also set any variables that are only used in the interactive shell (e.g. $LS_COLORS).

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# bindkey -e
# It's for when you run compinstall again. It lets compinstall find where it has written out zstyle statements for you last time. This way, you can run compinstall again to update them.
zstyle ':compinstall' filename '$HOME/.zshrc'

# SET: zsh-specific options
# -> hist_expire_dups_first = delete duplicates first when HISTFILE size exceeds HISTSIZE
# -> hist_ignore_dups = ignore duplicated commands history list
# -> hist_ignore_space = ignore commands that start with space
# -> hist_verify = show command with history expansion to user before running it
# -> appendhistory = make sure that Arrow keys bring your history
# -> correctall = asks you to correct the mistyped words (n for no, y for yes, a for all, e for exit)
# -> globdots = match files beginning with a "." without explicitly specifying the dot (e.g., tab completion)
setopt hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_ignore_space hist_verify appendhistory notify correctall globdots
# -> beep = disable beep sounds
unsetopt beep
export CLICOLOR=1
export LSCOLORS="BaFxGxDxCxegedabagaced"
PROMPT="%B%F{red}[%F{yellow}%~%F{red}] $ %b%F{white}"

# PATH: add homebrew (package manager)
eval "$(/opt/homebrew/bin/brew shellenv)"

# SET: nano as default CLI editor (instead of vi)
export EDITOR="nano"

# ADD: custom CLI aliases
source ~/.zsh_aliases

# PATH: add zsh completions
#FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
FPATH=/opt/homebrew/share/zsh-completions:$FPATH

# highlight auto-completion with tab
zstyle ':completion:*' menu select

# On slow systems, checking the cached .zcompdump file to see if it must be regenerated adds a noticable delay to zsh startup.
autoload -Uz compinit
compinit

# PATH: add zsh suggestions
# -> ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE = set max length to 20 characters
# -> ZSH_AUTOSUGGEST_STRATEGY:
# --> history = chooses the most recent match from history
# --> completion = chooses a suggestion based on what tab-completion would suggest (requires zpty module; available on macos by default)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# PATH: add zsh syntax highlighting, set max length, add extra highlighters
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
# must be last command to execute!
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
