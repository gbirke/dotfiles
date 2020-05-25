# See https://github.com/junegunn/fzf#respecting-gitignore
if type -sq fd
	export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
end
