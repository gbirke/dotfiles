function zsh_history -d "Search through the zsh history with fzf"
    set -q ZSH_HISTFILE; or set ZSH_HISTFILE ~/.zsh_history
    set -q FZF_ZSH_HISTORY_SEARCH; or set FZF_ZSH_HISTORY_SEARCH --no-sort

    # remove duplicate history entries with awk and only output commands
    awk -F\; '{ if( a[$2] == 0) print $2; a[$2]++ }' $ZSH_HISTFILE | fzf $FZF_ZSH_HISTORY_SEARCH | read -l result
    and commandline -- $result
end
