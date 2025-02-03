# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

use std/util "path add"
path add "~/.local/bin"
path add "~/.local/share/go/bin"
path add "~/.cargo/bin"
path add "~/bin"
path add "/usr/local/bin"

# On a Mac, you must put the following lines into ~/.local/share/nushell/vendor/autoload/brew.nu
# path add "/opt/homebrew/bin"
# path add "/opt/homebrew/opt/fzf/bin"

$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"

alias ll = ls -la
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..

# Git aliases
alias gst = git status
alias grbc = git rebase --continue

# a POSIX `ls` remnant I can't live without
def lsaltr [] {
	ls -la | sort-by modified --reverse
}
