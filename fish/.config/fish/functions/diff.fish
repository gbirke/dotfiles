function diff
	if command -q delta
		/usr/bin/diff $argv | delta
	else if command -q colordiff
		/usr/bin/diff $argv | colordiff
	else
		/usr/bin/diff $argv
	end
end
