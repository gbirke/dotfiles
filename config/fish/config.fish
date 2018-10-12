set -x PATH $PATH \
    $HOME/bin \
    $HOME/.composer/vendor/bin

source ~/.config/fish/abbrevs.fish

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

[ -e "/usr/local/opt/node@8/bin" ]; and set -g fish_user_paths "/usr/local/opt/node@8/bin" $fish_user_paths
