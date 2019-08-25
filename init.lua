
-- Hammerspoon home: http://www.hammerspoon.org/go/
-- LUA quick refernce / cheat sheet: https://devhints.io/lua
-- LUA lanugage reference manual: https://www.lua.org/ftp/refman-5.0.pdf
-- Extensions (hs.*): https://github.com/Hammerspoon/hammerspoon/tree/master/extensions

hs.console.clearConsole()
local alert = require 'hs.alert'

import = require('utils/import')
import.clear_cache()

config = import('config')

function config:get(key_path, default)
    local root = self
    for part in string.gmatch(key_path, "[^\\.]+") do
        root = root[part]
        if root == nil then
            return default
        end
    end
    return root
end

hs.application.enableSpotlightForNameSearches(true)

local modules = {}

for _, v in ipairs(config.modules) do
    local module_name = 'modules/' .. v
	print('Importing ', module_name)
    local module = import(module_name)

    if module and type(module.init) == "function" then
        module.init()
    end

    table.insert(modules, module)
end

local buf = {}

if hs.wasLoaded == nil then
    hs.wasLoaded = true
    table.insert(buf, "Hammerspoon loaded: ")
else
    table.insert(buf, "Hammerspoon re-loaded: ")
end

table.insert(buf, #modules .. " modules.")

alert.show(table.concat(buf))

-------------------------------------------------
-- Glen's additional configuration
-------------------------------------------------

import('glensSpoons')

--spaces = require("hs._asm.undocumented.spaces")

--[[ print all key codes
for key,value in pairs(require 'hs.keycodes'.map) do print(key,value) end
--]]
