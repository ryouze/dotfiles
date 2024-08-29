# Disable shell session restore
# Why we need to put the variable in ~/.zprofile
# When Zsh is started as an interactive shell (login or not), it will source /etc/zshrc, and ~/.zshrc, in that order. If (and only if) macOS’s /etc/zshrc runs inside Terminal.app, it calls /etc/zshrc_Apple_Terminal, which starts the “Save/Restore” feature. This means that we cannot set the variable to disable this feature in ~/.zshrc, because that file is read only after the feature has already been started, and “restored” your previous session.
# However, whenever you open a new tab or window in Apple’s Terminal.app, it starts a new interactive login shell. When a Zsh login shell starts up, it sources ~/.zprofile, and does so before sourcing /etc/zshrc.
export SHELL_SESSIONS_DISABLE=1
