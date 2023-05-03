# Set binary paths dependent on local environment
[ -e "$HOME/.composer/vendor/bin" ]; and set -u fish_user_paths $HOME/.composer/vendor/bin $fish_user_paths
# Keep this at the bottom to make sure $HOME/bin is the first entry
[ -e "$HOME/bin" ]; and set -u fish_user_paths $HOME/bin $fish_user_paths

# TODO - when all my machines have fish 3.6, replace `set -u fish_user_paths` with `fish_add_path`

source ~/.config/fish/abbrevs.fish

# set nvim as the git editor
set -x GIT_EDITOR nvim


