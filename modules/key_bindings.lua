
-- Credit to: https://github.com/jasonrudolph/keyboard/tree/master/hammerspoon
-- Key reference: https://www.hammerspoon.org/docs/hs.keycodes.html#map
--  and https://www.hammerspoon.org/docs/hs.utf8.html#registeredKeys
--local base64 = import('utils/base64')
local log = hs.logger.new('key_bindings.lua', 'debug')


keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

hs.hotkey.bind({'alt', 'shift'}, 'space', function()
	keyUpDown({}, 'menu') --hs.utf8.codepointToUTF8(0x2326))
end)

hs.hotkey.bind({'shift'}, 'delete', function()
	keyUpDown({}, 'forwardDelete') --hs.utf8.codepointToUTF8(0x2326))
end)
-- hs.hotkey.bind({'cmd'}, 'left', function()
-- 	keyUpDown({}, 'leftWord') --hs.utf8.codepointToUTF8(0x2326))
-- end)
-- hs.hotkey.bind({'cmd'}, 'right', function()
-- 	keyUpDown({}, 'rightWord') --hs.utf8.codepointToUTF8(0x2326))
-- end)
-- hs.hotkey.bind({'cmd'}, 'left', function()
-- 	keyUpDown({}, 'leftWord') --hs.utf8.codepointToUTF8(0x2326))
-- end)
-- hs.hotkey.bind({'cmd'}, 'right', function()
-- 	keyUpDown({}, 'rightWord') --hs.utf8.codepointToUTF8(0x2326))
-- end)


function trimWhitespaceFromBoth(s)
   return s:match "^%s*(.-)%s*$"
end
function noop() end
-- Credit: https://tayloraburgess.com/blog/2017-04-22-macos-vi/
function fastKeyStroke (modifiers, character)
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end
function fastType (text)
  text:gsub(".", function(c)
    fastKeyStroke({}, c)
  end)
end

hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'd', function()
	fastType('datarecognition')
end)
hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'c', function()
	fastType('datarecognitioncorp.com')
end)
hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'g', function()
	ffastType('gcoakley@datarecognitioncorp.com')
end)

hs.hotkey.bind({'alt', 'cmd', 'shift'}, 'p', function()
	local FileUtil = import('utils/file_util')
	local wnpw = FileUtil.readWholeFile('/Users/glencoakley/.ssh/wnpw.b64')
	log.d('Read from file ->', wnpw)
	wnpw = hs.base64.decode(wnpw)
	log.d('Decoded ->', wnpw)
	hs.eventtap.keyStrokes(wnpw)
end)
