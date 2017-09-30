if not set -q abbrs_initialized
    set -U abbrs_initialized

    abbr gst 'git status'
    abbr grbc 'git rebase --continue'
    abbr gca 'git commit -a -m'
end
