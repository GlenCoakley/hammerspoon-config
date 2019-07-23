
local function module_init()
	local mash, key

	mash = config:get("lock.mash", hyper_all)
	key = config:get("lock.key", "L")
	hs.hotkey.bind(mash, key, function()
		hs.caffeinate.lockScreen()
	end)

	mash = config:get("lock.mash", hyper_all)
	key = config:get("lock.key", "A")
	hs.hotkey.bind(mash, key, function()
		hs.caffeinate.startScreensaver()
	end)

	mash = config:get("lock.mash", hyper_all)
	key = config:get("lock.key", "S")
	hs.hotkey.bind(mash, key, function()
	    hs.caffeinate.systemSleep()
	end)
end

return {
    init = module_init
}
