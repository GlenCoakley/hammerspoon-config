local hotkey = require 'hs.hotkey'

return {
    init = function()
        hotkey.bind(config:get("repl.mash", shift_hyper),
        config:get("repl.key", "I"), hs.openConsole)
    end
}
