local hotkey = require 'hs.hotkey'

local function module_init()
    local mash = config:get("lock.mash", { "cmd", "alt" })
    local key = config:get("lock.key", "L")

    hotkey.bind(mash, key, function()
        os.execute("/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend")
    end)

    mash = config:get("lock.mash", shift_hyper)
    key = config:get("lock.key", "S")

    hotkey.bind(mash, key, function()
        os.execute("/usr/bin/pmset sleepnow")
    end)
end

return {
    init = module_init
}
