require("luasnip.loaders.from_vscode").lazy_load()

local ls=require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- My custom snippets

-- Team commits when mobbing or pairing
ls.add_snippets('gitcommit', {
	s('funcommit', t({
		'Co-Authored-By: Abban Dunne <abban.dunne@wikimedia.de>',
		'Co-Authored-By: Corinna Hillebrand <corinna.hillebrand@wikimedia.de>',
    	'Co-Authored-By: Sperling-0 <tanuja.doriya@wikimedia.de>'
	}))
})
