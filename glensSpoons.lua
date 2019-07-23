
-- Global log level. Per-spoon log level can be configured in each Install:andUse block below.
hs.logger.defaultLogLevel = "info"

hs.loadSpoon("SpoonInstall")

-- This is just a shortcut to make the declarations below look more readable,
-- i.e. Install:andUse instead of spoon.SpoonInstall:andUse.
Install = spoon.SpoonInstall

-- I prefer sync notifications, makes them easier to read.
Install.use_syncinstall = true


-- ########## Window and screen manipulation ##########

-- Could also just use the build-in 'layout' and/or 'grid' with their snap-to sizing, nudging, shrinking and expanding: https://www.hammerspoon.org/docs/hs.grid.html#setGrid

-- The WindowHalfsAndThirds spoon sets up multiple key bindings for manipulating the size and position of windows.
windowChord = {"alt", "cmd"}
Install:andUse("WindowHalfsAndThirds",
               {
                 config = {
                   use_frame_correctness = true
                 },
                 hotkeys = {
   left_half    = { windowChord, "Left" },
   right_half   = { windowChord, "Right" },
   top_half     = { windowChord, "Up" },
   bottom_half  = { windowChord, "Down" },
   top_left     = { windowChord, "1" },
   top_right    = { windowChord, "2" },
   bottom_left  = { windowChord, "3" },
   bottom_right = { windowChord, "4" },
   max_toggle   = { hyper, "f" },
   undo         = { hyper, "z" },
   center       = { hyper, "c" },
   third_left   = { {"ctrl", "alt"       }, "Left" },
   third_right  = { {"ctrl", "alt"       }, "Right" },
   third_up     = { {"ctrl", "alt"       }, "Up" },
   third_down   = { {"ctrl", "alt"       }, "Down" },
   larger       = { {        "alt", "cmd", "shift"}, "Right" },
   smaller      = { {        "alt", "cmd", "shift"}, "Left" },
}
               }
)

-- The WindowScreenLeftAndRight spoon sets up key bindings for moving windows between multiple screens.

Install:andUse("WindowScreenLeftAndRight",
               {
                 hotkeys = 'default'
               }
)


-- ########## Organization and Productivity ##########


-- The UniversalArchive spoon sets up a single key binding (Ctrl-Cmd-a) to archive the current item in Evernote,
-- Mail and Outlook.

--Install:andUse("UniversalArchive",
--              {
--                config = {
--                  evernote_archive_notebook = ".Archive",
--                  outlook_archive_folder = "Archive (diego.zamboni@swisscom.com)",
--                  archive_notifications = false
--                },
--                hotkeys = { archive = { { "ctrl", "cmd" }, "a" } }
--              }
--)

-- Route URLs to different applications with pattern matching.

Install:andUse("URLDispatcher", {})

-- The EvernoteOpenAndTag spoon sets up some missing key bindings for note manipulation in Evernote.

--Install:andUse("EvernoteOpenAndTag",
--               {
--                 hotkeys = {
--                   open_note = { hyper, "o" },
--                   ["open_and_tag-+work,+swisscom"] = { hyper, "w" },
--                   ["open_and_tag-+personal"] = { hyper, "p" },
--                   ["tag-@zzdone"] = { hyper, "z" }
--                 }
--               }
--)


-- ########## System and UI ##########

-- The KSheet spoon traverses the current application’s menus and builds a cheatsheet of the keyboard shortcuts,
-- showing it in a nice popup window.

--Install:andUse("KSheet",
--               {
--                 hotkeys = {
--                   toggle = { hyper, "/" }
--}})

-- Windows manipulation.

Install:andUse("WinWin", {})

-- ########## Network transitions ##########

-- The WiFiTransitions spoon allows triggering arbitrary actions when the SSID changes. I am interested in the
-- change from my work network (corpnet01) to other networks, mainly because at work I need a proxy for all
-- connections to the Internet. I have two applications which don’t handle these transitions gracefully on their
-- own: Spotify and Adium. So I have written a couple of functions for helping them along.
-- The reconfigSpotifyProxy function quits Spotify, updates the proxy settings in its config file, and restarts it.

function reconfigSpotifyProxy(proxy)
  local spotify = hs.appfinder.appFromName("Spotify")
  local lastapp = nil
  if spotify then
    lastapp = hs.application.frontmostApplication()
    spotify:kill()
    hs.timer.usleep(40000)
  end
  --   hs.notify.show(string.format("Reconfiguring %sSpotify", ((spotify~=nil) and "and restarting " or "")), string.format("Proxy %s", (proxy and "enabled" or "disabled")), "")
  -- I use CFEngine to reconfigure the Spotify preferences
  cmd = string.format("/usr/local/bin/cf-agent -K -f %s/files/spotify-proxymode.cf%s", hs.configdir, (proxy and " -DPROXY" or " -DNOPROXY"))
  output, status, t, rc = hs.execute(cmd)
  if spotify and lastapp then
    hs.timer.doAfter(3,
                     function()
                       if not hs.application.launchOrFocus("Spotify") then
                         hs.notify.show("Error launching Spotify", "", "")
                       end
                       if lastapp then
                         hs.timer.doAfter(0.5, hs.fnutils.partial(lastapp.activate, lastapp))
                       end
    end)
  end
end

-- The configuration for the WiFiTransitions spoon invoked these functions with the appropriate parameters.

Install:andUse("WiFiTransitions",
               {
                 config = {
                   actions = {
                     -- { -- Test action just to see the SSID transitions
                     --    fn = function(_, _, prev_ssid, new_ssid)
                     --       hs.notify.show("SSID change", string.format("From '%s' to '%s'", prev_ssid, new_ssid), "")
                     --    end
                     -- },
                     { -- Enable proxy in Spotify and Adium config when joining corp network
                       to = "corpnet01",
                       fn = {hs.fnutils.partial(reconfigSpotifyProxy, true),
                             hs.fnutils.partial(reconfigAdiumProxy, true),
                       }
                     },
                     { -- Disable proxy in Spotify and Adium config when leaving corp network
                       from = "corpnet01",
                       fn = {hs.fnutils.partial(reconfigSpotifyProxy, false),
                             hs.fnutils.partial(reconfigAdiumProxy, false),
                       }
                     },
                   }
                 },
                 start = true,
               }
)

-- The FadeLogo spoon simply shows an animation of the Hammerspoon logo to signal the end of the config load.

Install:andUse("FadeLogo",
               {
                 config = {
                   default_run = 1.0,
                 },
                 start = true
               }
)
-- If you don’t want to use FadeLogo, you can have a regular notification.

-- hs.notify.show("Welcome to Hammerspoon", "Have fun!", "")
