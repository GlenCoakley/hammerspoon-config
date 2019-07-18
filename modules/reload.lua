local hotkey = require 'hs.hotkey'

return {
    init = function()
        hotkey.bind(config:get("reload.mash", shift_hyper),
        config:get("reload.key", "R"), hs.reload)
    end
}
