function diff
	set __diffcmd (which diff)
	if command -q delta
		$__diffcmd $argv | delta
	else if command -q colordiff
		$__diffcmd $argv | colordiff
	else
		$__diffcmd $argv
	end
end
