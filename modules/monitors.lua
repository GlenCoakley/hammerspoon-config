-- TODO Put Flux-like settings here usinfg hs.redshift: 
--   https://www.hammerspoon.org/docs/hs.redshift.html

local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local geometry = require 'hs.geometry'
local mouse = require 'hs.mouse'

local position = import('utils/position')
local monitors = import('utils/monitors')

local function init_module()
    for id, monitor in pairs(monitors.configured_monitors) do

        hotkey.bind(hyper_all, "PAD" .. id, function()
            local win = window.focusedWindow()
            if win ~= nil then
                win:setFrame(monitor.dimensions:relative_window_position(win))
            end
        end)
    end
end

return {
    init = init_module
}
