#!/usr/bin/env zsh

##### Core behavior
#setopt prompt_subst  # Allow parameter and command substitution inside $PROMPT
setopt pipefail  # Make a pipeline return failure if any command in it fails
setopt interactive_comments  # Allow # comments at the interactive command line
setopt nobeep  # Disable the terminal bell on errors or completions
setopt notify  # Print job status changes as they happen, not just at prompts
setopt nocheckjobs  # Do not warn about running background jobs when exiting
#setopt autocd  # Allow typing a directory name alone to cd into it
setopt auto_pushd  # cd also saves the previous directory on an internal stack so quick backtracking is possible
setopt pushd_silent  # Do not print the directory stack after pushd or popd
setopt pushd_ignore_dups  # Do not add the same directory to the stack more than once
setopt globdots  # Include dotfiles in filename globbing
setopt extendedglob  # Enable extended globbing patterns like ^, ~, and qualifiers
setopt nocaseglob  # Make filename globbing case-insensitive
setopt numericglobsort  # Sort glob results numerically when appropriate (e.g., file2 before file10)
#setopt rc_expand_param  # Expand arrays and parameter substitutions within words
setopt correct  # Offer corrections for command names only

##### History: long, clean, de-duplicated, shared across sessions
HISTFILE="$HOME/.zsh_history"  # Path to the on-disk history file
HISTSIZE=100000  # Number of history entries kept in memory
SAVEHIST=100000  # Number of history entries saved to disk
#setopt appendhistory  # Append new history lines to the history file instead of overwriting it
setopt share_history  # Share history between all interactive shells in real time
setopt extended_history  # Record timestamp and duration for each history entry
setopt hist_ignore_space  # Do not record commands that start with a leading space
setopt hist_reduce_blanks  # Remove superfluous blanks from each command line before saving
setopt hist_find_no_dups  # When searching history, do not find the same command more than once
setopt hist_ignore_dups  # Do not record a command if it is the same as the previous command
setopt hist_ignore_all_dups  # When a duplicate command is added, remove the older identical command from history
#setopt hist_expire_dups_first  # When trimming history, expire older duplicate entries before unique ones
setopt hist_verify  # After history expansion, reload the line into the editor instead of executing immediately
REPORTTIME=5  # After any command that takes 5 seconds or more, print timing information

##### PATH and FPATH: dedup and compose
typeset -U path fpath  # Make $path and $fpath unique arrays to auto-deduplicate entries
eval "$(/opt/homebrew/bin/brew shellenv)"  # Initialize Homebrew environment (PATH, MANPATH, etc.) for Apple Silicon installs
export PATH="$HOME/.local/bin:$PATH"  # Prepend user-local bin directory for custom tools
fpath=(/opt/homebrew/share/zsh/site-functions /opt/homebrew/share/zsh-completions "$HOME/.docker/completions" $fpath)  # Add completion function directories for Homebrew, user functions, and Docker

##### Tools and environment
export EDITOR="nano"  # Set the default terminal editor
export VISUAL="$EDITOR"  # Use the same editor for visual contexts
export PAGER="less"  # Use less as the default pager
export LESS="-R -F -X -M"  # Configure less: pass-through colors, quit if one screen, do not clear on exit, verbose prompt
export CLICOLOR=1  # Enable color for compatible BSD ls and related tools
export LSCOLORS="BaFxGxDxCxegedabagaced"  # Set BSD ls color scheme for files and directories

##### Aliases
source "$HOME/.zsh_aliases"  # Load user-defined aliases and functions

##### Completion: fast, case-insensitive, menu-select
autoload -Uz compinit  # Load the compinit function for initializing completion
zmodload zsh/complist  # Load the complist module to enable menu completion and colored lists
#zstyle ':completion:*' rehash true  # Re-scan $PATH on completion to find newly installed commands
zstyle ':completion:*' completer _complete _approximate  # Try exact completion first, then allow approximate matches
zstyle ':completion:*' max-errors 1 numeric  # Permit one typo and interpret the value numerically
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'  # Case-insensitive and separator-flexible matching
zstyle ':completion:*' accept-exact true  # Immediately accept exact matches, even when other completions exist
zstyle ':completion:*' menu select=2  # Start interactive menu selection when there are two or more matches
compinit -d "$HOME/.zcompdump"  # Initialize completion; cache dump for faster startup

##### Autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100  # Disable autosuggestions when the input exceeds N characters
ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # Prioritize previous commands, then fall back to completions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh  # Enable inline autosuggestions

##### fzf key bindings
#source <(fzf --zsh)  # Do not use the full fzf shell extension, only key bindings
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh  # Load fzf key bindings for history search, file completion, and widgets

##### Prompt: Colorful and minimal
autoload -Uz colors  # Load the colors helper to ensure named color sequences are available
colors  # Initialize color variables for prompt usage
PROMPT='%B%F{red}[%F{yellow}%~%F{red}] $ %b%f'

##### Environmental variables
export UV_EXCLUDE_NEWER="3 days"
export PIP_UPLOADED_PRIOR_TO="P3D"

##### Syntax highlighting (must be last)
ZSH_HIGHLIGHT_MAXLENGTH=512  # Limit per-line highlighting length for performance
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)  # Enable useful highlighters for syntax feedback
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # Load syntax highlighting last so it hooks into widgets correctly
