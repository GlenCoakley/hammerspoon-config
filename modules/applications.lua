local message = require('utils.status_message')

local msgCanUseTouchBar = message.new('You can also use the Touch Bar')

local isInTerminal = function()
  app = hs.application.frontmostApplication():name()
  return app == 'iTerm2' or app == 'Terminal'
end


local function module_init()
	local mash, key

	-- -- Replaced by screen_lock.lua > hs.caffeinate.lockScreen()	--
	-- mash = config:get("lock.mash", hyper_all)
	-- key = config:get("lock.key", "L")
	-- hs.hotkey.bind(mash, key, function()
	--     --os.execute("/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend")
	-- end)

	-- -- Replaced by screen_lock.lua > hs.caffeinate.systemSleep()
	-- mash = config:get("lock.mash", hyper_all)
	-- key = config:get("lock.key", "S")
	-- hs.hotkey.bind(mash, key, function()
	-- 	msgCanUseTouchBar:notify(2)
	--     hs.caffeinate.systemSleep()
	-- 	--os.execute("/usr/bin/pmset sleepnow")
	-- end)

end

return {
    init = module_init
}
