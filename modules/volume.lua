
local function module_init()

  function changeVolume(diff)
    return function()
		print("Volume change requested: ", diff)
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local new = math.min(100, math.max(0, math.floor(current + diff)))

      if new > 0 then
        hs.audiodevice.defaultOutputDevice():setMuted(false)
      end
      hs.alert.closeAll(0.0)
      hs.alert.show("Volume " .. new .. "%", {}, 0.5)
      hs.audiodevice.defaultOutputDevice():setVolume(new)
    end
  end

  hs.hotkey.bind(hyper, 'Down', changeVolume(-1))
  hs.hotkey.bind(hyper, 'Up', changeVolume(1))
end

return {
    init = module_init
}
