-- Language-Specific plugins
return {
	'pearofducks/ansible-vim',
	'vito-c/jq.vim',
	{ 
		'plasticboy/vim-markdown',
		config = function()
			-- Disable automated folding of markdown files
			vim.g.vim_markdown_folding_disabled = 1
		end
	},

	-- lanuages I haven't used in a while
	-- 'andrewstuart/vim-kubernetes',
	-- 'towolf/vim-helm',
}
