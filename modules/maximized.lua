local hotkey = require 'hs.hotkey'
local window = require 'hs.window'

local function module_init()
    local mash = config:get('maximized.mash', hyper)
    local key = config:get('maximized.key', "m")

    hotkey.bind(mash, key, function()
        local win = window.focusedWindow()
        if win ~= nil then
            win:setFullScreen(not win:isFullScreen())
        end
    end)
end

return {
    init = module_init
}
