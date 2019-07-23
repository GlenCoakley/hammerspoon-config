
-- Credit to: https://github.com/jasonrudolph/keyboard/tree/master/hammerspoon
-- Key reference: https://www.hammerspoon.org/docs/hs.utf8.html#registeredKeys

local log = hs.logger.new('key_bindings.lua', 'debug')

keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

hs.hotkey.bind({'shift'}, 'delete', function()
	keyUpDown({}, 'forwardDelete') --hs.utf8.codepointToUTF8(0x2326))
end)
