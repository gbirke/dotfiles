-- Start auto-pair plugin
require "pears".setup( function(conf)
	-- For inserting brackets in markdown files on a laptp,
	-- where there is no dedicated delete key, only backspace
	conf.remove_pair_on_outer_backspace(false)
end )


