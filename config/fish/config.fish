# Set binary paths dependent on local environment
[ -e "/usr/local/opt/node@10/bin" ]; and set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
[ -e "$HOME/.composer/vendor/bin" ]; and set -x fish_user_paths $HOME/.composer/vendor/bin $fish_user_paths
# Keep this at the bottom to make sure $HOME/bin is the first entry
[ -e "$HOME/bin" ]; and set -x fish_user_paths $HOME/bin $fish_user_paths

source ~/.config/fish/abbrevs.fish

# set nvim as the git editor
set -x GIT_EDITOR nvim


