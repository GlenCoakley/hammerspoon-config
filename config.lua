local config = {}
hyper = { "ctrl", "alt", "cmd" }
hyper_ambi = { "alt", "cmd", "shift" }
hyper_shift = { "ctrl", "alt", "cmd", "shift" }

config.modules = {
    "arrangement",
    "monitors",
    -- "repl",
    "reload",
    "arrows",
    "lock"
    -- "fullscreen"
}

-- Maps monitor id -> screen index.
config.monitors = {
    autodiscover = true,
    rows = 1
}

-- Window arrangements.
config.arrangements = {
    fuzzy_search = {
        mash = hyper_shift,
        key = "Z"
    },
    {
        name = "zen",
        alert = true,
        mash = hyper_shift,
        key = "A",
        arrangement = {
            {
                app_title = "^Mail",
                monitor = 1,
                position = "full_screen",
            },
            {
                app_title = "^Slack",
                monitor = 4,
                position = "left"
            },
            {
                app_title = "^Messages",
                monitor = 4,
                position = function(d)
                    return d:translate_from('bottom_right', {
                        y = 42,
                        h = -40
                    })
                end
            },
            {
                app_title = "^ChronoMate",
                monitor = 4,
                position = function(d)
                    return d:translate_from('top_right', {
                        h = 42
                    })
                end
            },
            {
                app_title = "^Spotify",
                monitor = 6,
                position = "full_screen",
            }
        }
    }
}

return config
