if not set -q abbrs_initialized
    set -U abbrs_initialized

    # Git aliases
    abbr gst 'git status'
    abbr grbc 'git rebase --continue'
    abbr gca 'git commit -a -m'

    # Jujutsu aliases
    abbr jst 'jj status'

    # Directory navigation
    abbr ... 'cd ../..'
    abbr .... 'cd ../../..'
    abbr ..... 'cd ../../../..'
end
