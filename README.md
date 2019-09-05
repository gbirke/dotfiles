# Dotfiles for chiborg

This is my collection of personal dotfiles.

## Installation

Installing the files needs the GNU [`stow`](http://www.gnu.org/software/stow/) command.

1. Clone this repo to ~/.dotfiles:
  `git clone https://github.com/gbirke/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. `./install_all.sh`

You may choose a different name than .dotfiles, but make sure it's below your home directory. 
Otherwise you have to edit the install script to use the `--target DIR` parameter of `stow`.

### Install single dotfiles
- `stow ack`
- `stow bash`
- `stow git`
- `stow vim`
- `stow zsh`

## Fish configuration
First, install [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish), [powerline fonts](https://github.com/powerline/fonts) for the [bob-the-fish theme](https://github.com/oh-my-fish/theme-bobthefish), and [fzf](https://github.com/junegunn/fzf)

    rm -rf ~/.config/omf && ln -s ~/.dotfiles/config/omf ~/.config/omf

    ln -s ~/.dotfiles/config/fish ~/.config/fish


## Configuring git name and email address
I intentionally left out the name and email address from the git configuration because I use different ones for work and private commits.
They can be added by creating the file `~/.gituser` with the following contents:

    [user]
        name = Gabriel Birke
        email = gabriel.birke@gmail.com

    # vim: ft=gitconfig


# Using VIM configuration with VimPlug package manager
If you want to use the vim configuration with the [VimPlug][2] package manager, use the following commands:

    install_vimplug.sh
    stow vim-plug
    vim -c PlugInstall

## Thanks
Thanks to Brandon Invergo who [introduced me to this easy method of managing the dotfiles][1].

[1]: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two
[2]: https://github.com/junegunn/vim-plug
