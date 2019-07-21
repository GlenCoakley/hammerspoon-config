local config = {}
hyper = { "ctrl", "alt", "cmd" }
hyper_both = { "alt", "cmd", "shift" }
hyper_left = { "ctrl", "alt", "shift" }
hyper_all = { "ctrl", "alt", "cmd", "shift" }

config.modules = {
    -- "app_selector",
    "arrangement",
    "arrows",
	-- "auto_reload",
	-- "fullscreen",
	-- "hop",
	"lock",
    "monitors",
    "reload",
    -- "repl",
	-- "slide",
	-- "test",
	"volume"
}

-- Maps monitor id -> screen index.
config.monitors = {
    autodiscover = true,
    rows = 1
}

-- Window arrangements.
config.arrangements = {
    fuzzy_search = {
        mash = hyper,
        key = "Z"
    },
    {
        name = "zen",
        alert = true,
        mash = hyper,
        key = "A",
        arrangement = {
            {
                app_title = "^Mail",
                monitor = 1,
                position = "full_screen",
            },
            {
                app_title = "^Messages",
                monitor = 2,
                position = function(d)
                    return d:translate_from('bottom_right', {
                        y = 42,
                        h = -40
                    })
                end
            }
		}
    }
}

return config
