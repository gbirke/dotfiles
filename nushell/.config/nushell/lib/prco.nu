
# A custom function to select a GitHub pull request and check it out
def prco [] {
	let pull_requests = hub pr list 
	if $pull_requests == "" {
		print "No pull requests found"
		return
	}
	let selected_pr = ($pull_requests | lines | input list --fuzzy "Select pull request")
	if ($selected_pr | is-empty) {
		return
	}
	let result = $selected_pr | parse --regex '#(?<id>\d+)'
	if ( $result | is-empty ) {
		print "Could not parse selected PR"
		print $selected_pr
		return
	}
	hub pr checkout ($result | first).id
}
