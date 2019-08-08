
-- Credit to: https://github.com/jasonrudolph/keyboard/tree/master/hammerspoon
-- Key reference: https://www.hammerspoon.org/docs/hs.utf8.html#registeredKeys
--local base64 = import('utils/base64')
local log = hs.logger.new('key_bindings.lua', 'debug')


keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

-- hs.hotkey.bind({'alt'}, 'space', function()
-- 	keyUpDown({}, 'menu') --hs.utf8.codepointToUTF8(0x2326))
-- end)

hs.hotkey.bind({'shift'}, 'delete', function()
	keyUpDown({}, 'forwardDelete') --hs.utf8.codepointToUTF8(0x2326))
end)


hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'd', function()
	hs.eventtap.keyStrokes('datarecognition')
end)
hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'c', function()
	hs.eventtap.keyStrokes('datarecognitioncorp.com')
end)
hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'g', function()
	hs.eventtap.keyStrokes('gcoakley@datarecognitioncorp.com')
end)

hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'p', function()
	hs.eventtap.keyStrokes(hs.base64.decode('')) -- put network password here.
end)
