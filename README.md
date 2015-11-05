# Dotfiles for chiborg

This is my collection of personal dotfiles.

## Installation

Installing the files needs the GNU [`stow`](http://www.gnu.org/software/stow/) command.

1. Clone this repo to ~/.dotfiles:  
  `git clone git@github.com:gbirke/dotfiles.git .dotfiles`
2. `cd ~/.dotfiles`
3. `./install_all.sh`

You may choose a differnt name than .dotfiles, but make sure it's below root. Otherwise you have to edit the install script to use the `--target DIR` parameter of `stow`.

### Install single dotfiles
- `stow ack`
- `stow vim`
- `stow git`
- `stow bash`
- `stow zsh`

## Thanks
Thanks to Brandon Invergo who [introduced me to this easy method of managing the dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two).
