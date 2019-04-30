# Pull Request Check Out - check out pull request branches from GitHub
function prco
    hub pr list             | # Download list of pull requests
    fzf                     | # Show list as selectable menu
    egrep -o '[[:digit:]]+' | # extract sequences of digits
    head -n 1               | # drop all but the first sequence (PR id)
    xargs hub pr checkout     # convert pro ID input to argument & check out
end
