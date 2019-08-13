
local function module_init()

  function changeVolume(diff)
    return function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newRaw = math.floor(current + diff + 0.5)
      local new = math.min(100, math.max(0, newRaw))
		  -- print("Current volume: ", current, ", change requested: ", diff, ", calculated: ", newRaw)

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
