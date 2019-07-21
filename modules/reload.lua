local hotkey = require 'hs.hotkey'

return {
    init = function()
        hotkey.bind(config:get("reload.mash", hyper_all),
        config:get("reload.key", "R"), hs.reload)
    end
}
