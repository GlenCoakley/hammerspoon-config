local config = {}
hyper = { "ctrl", "alt", "cmd" }
hyper_left = { "ctrl", "alt", "shift" }
hyper_right = { "alt", "cmd", "shift" }
hyper_split = { "ctrl", "cmd", "shift" }
hyper_all = { "ctrl", "alt", "cmd", "shift" }

config.modules = {
    -- "app_selector",
    "applications",
	"arrangement",
    -- Handled by WindowHalfsAndThirds <- "arrows",
	-- "auto_reload_hammerspoon",
	-- "maximized",
	"hwsw_changes", 
	-- "hop",
	"key_bindings",
    "monitors",
    "reload",
    -- "repl",
	"screen_lock",
	-- "slide_windows",
	"volume",
	-- "test" -- Keep this last so, breaks as little as possible.
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
        key = "f"
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
