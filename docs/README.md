# dotfiles
my setup for macos / linux


---


# list of contents
* `.help_list/` (location: `~`)
  * `man-git.txt` - list of git commands, called using `man-git`
  * `man-venv.txt` - list of python virtual env commands, called using `man-venv`
* `homedir/` - shell config files (location: `~`)
  * `.gitconfig` - git configuration, sets branch name & editor
  * `.gitignore` - files to be ignored when using `git add .`
  * `.hushlogin` - disables "last login" msg in terminal
  * `.nanorc` - enables line numbers, tabsize & points syntax highlighting location to homebrew
  * `.zsh_aliases` - aliases for zsh, e.g., `igrep`, `http`-start
  * `.zshrc` - enables zsh features, adds brew to path & aliases
* `scripts/` - external scripts (location: `~/Software/Scripts`)
  * `is_rosetta_installed.sh` - answers if rosetta2 is installed on arm64 macbooks
  * `pic_rename.py` - renames pics to random strings in `~/Pictures/pic`
  * `pip_update.py` - updates all pip3 packages (also works in venv)
* `software_settings/` - software-specific settings (location: varies)
  * `chrome/` - chrome [plist](https://chromeenterprise.google/policies/)
  * `firefox/` - firefox [policies.json](https://support.mozilla.org/en-US/kb/customizing-firefox-using-policiesjson) & static ublock filters
  * `github/` - gh cli switcher for work/personal github account // [author](https://gist.github.com/yermulnik/017837c01879ed3c7489cc7cf749ae47)
  * `homebrew/` - packages list (e.g., python, vlc)
  * `vscode/` - settings, keybinds, list of extensions
