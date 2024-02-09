local appid = '1202547534891982870' -- ТУК СЛАГАТЕ APPLICATION ID на вашият бот!!
local image1 = 'logo.png'
local image2 = 'image'
local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = -1

CreateThread(function()
  while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do         
    Wait(500)
    prevframes = GetFrameCount()
    prevtime = GetGameTimer()            
    end

  while true do         
    curtime = GetGameTimer()
      curframes = GetFrameCount()       
        
      if((curtime - prevtime) > 1000) then
          fps = (curframes - prevframes) - 1                
          prevtime = curtime
          prevframes = curframes
      end      
    Wait(350)
  end    
end)

function players()
  local players = {}

  for i = 0, 62 do
      if NetworkIsPlayerActive(i) then
          table.insert(players, i)
      end
  end

  return players
end

function SetRP()
  local name = GetPlayerName(PlayerId())
  local id = GetPlayerServerId(PlayerId())

  SetDiscordAppId(appid)
  SetDiscordRichPresenceAsset(image1)
  SetDiscordRichPresenceAssetSmall(image2)
end

Citizen.CreateThread(function()
  while true do

  Citizen.Wait(1)
    SetRP()
    SetDiscordRichPresenceAssetText('https://discord.gg/7mMBUC6cvK') -- тук поставете пак линка на дискорда!!
      players = {}
      for i = 0, 128 do
          if NetworkIsPlayerActive( i ) then
              table.insert( players, i )
          end
      end
    SetRichPresence("FPS: " ..fps.. " | Nick: " ..GetPlayerName(PlayerId()) .. " | ID: " ..GetPlayerServerId(PlayerId()) .. "")

    SetDiscordRichPresenceAction(0, "🔧Discord🔧", "https://discord.gg/") -- тук слагате вашият линк за дискорда!!
    SetDiscordRichPresenceAction(1, "🌍FIVEM🌍", "fivem://connect/87.121.54.145:30120") --тук слагате вашето ип на сървъра!!
end
end)