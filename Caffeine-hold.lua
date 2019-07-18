-- The Caffeine spoon allows preventing the display and the machine from sleeping. I use it frequently when
-- playing music from my machine, to avoid having to unlock the screen whenever. I want to change the music.

Install:andUse("Caffeine",
			   {
                 start = true,
                 hotkeys = {
                   toggle = { hyper, "1" }
                 },
                 fn = function(s)
                   BTT:bindSpoonActions(s, {
                                          toggle = {
                                            kind = 'touchbarWidget',
                                            uuid = '72A96332-E908-4872-A6B4-8A6ED2E3586F',
                                            name = 'Caffeine',
                                            widget_code = [[
do
  title = " "
  icon = hs.image.imageFromPath(spoon.Caffeine.spoonPath.."/caffeine-off.pdf")
  if (hs.caffeinate.get('displayIdle')) then
    icon = hs.image.imageFromPath(spoon.Caffeine.spoonPath.."/caffeine-on.pdf")
  end
  print(hs.json.encode({ text = title, icon_data = BTT:hsimageToBTTIconData(icon) }))
end
  ]],
                                            code = "spoon.Caffeine.clicked()",
                                            widget_interval = 1,
                                            color = hs.drawing.color.x11.black,
                                            icon_only = true,
                                            icon_size = hs.geometry.size(15,15),
                                            BTTTriggerConfig = {
                                              BTTTouchBarFreeSpaceAfterButton = 0,
                                              BTTTouchBarItemPadding = -6,
                                            },
                                          }
                   })
                 end
})

