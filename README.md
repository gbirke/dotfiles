# Dotfiles for chiborg

This is my collection of personal dotfiles.

## Installation

Installing the files needs the GNU [`stow`](http://www.gnu.org/software/stow/) command.

1. Clone this repo to ~/.dotfiles:  
  `git clone https://github.com/gbirke/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. `./install_all.sh`

You may choose a different name than .dotfiles, but make sure it's below your home directory. Otherwise you have to edit the install script to use the `--target DIR` parameter of `stow`.

### Install single dotfiles
- `stow ack`
- `stow bash`
- `stow git`
- `stow vim`
- `stow zsh`

## Configuring git name and email address
Since I want my git config to be "universal", I left out the name and email address from the configuration (I use different ones for work and private commits). To add them, run the following commands:

    git config --global user.name "John Doe"
    git config --global user.email johndoe@example.com

Note however that this will change .gitconfig file. Don't commit those changes!
If anyone has a good solution for this, please contact me.

## Thanks
Thanks to Brandon Invergo who [introduced me to this easy method of managing the dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two).
