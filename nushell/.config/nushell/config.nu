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

#### Custom Functions

# a POSIX `ls` remnant I can't live without
def lsaltr [path?: string] {
	ls -la ($path|default "."| path expand)| sort-by modified
}

source ($nu.config-path | path dirname | path join "lib/prco.nu")

#### Completions
let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | from tsv --flexible --noheaders --no-infer
    | rename value description
}

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

let zoxide_completer = {|spans|
    $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        # carapace completions are incorrect for nu
        nu => $fish_completer
        # fish completes commits and branch names in a nicer way
        git => $fish_completer
        # use zoxide completions for zoxide commands
        __zoxide_z | __zoxide_zi => $zoxide_completer
        _ => $carapace_completer
    } | do $in $spans
}

$env.config.completions = {
	external: {
    	enable: true
        completer: $external_completer
    }
}

