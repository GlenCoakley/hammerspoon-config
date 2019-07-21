local hotkey = require 'hs.hotkey'

return {
    init = function()
        hotkey.bind(config:get("repl.mash", hyper_all),
        config:get("repl.key", "I"), hs.openConsole)
    end
}
