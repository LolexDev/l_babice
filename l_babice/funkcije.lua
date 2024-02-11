function progressbar(message, time,dict,clip,scenario)
  lib.progressCircle({
      duration = time,
      position = 'bottom',
      label = message,
      useWhileDead = false,
      canCancel = false,
      disable = {
        move = true,
        combat = true,
        mouse = false,
        car = true,
      },
      anim = {
        dict = dict,
        clip = clip,
        scenario = scenario
      }
    })
end

function progressbar2(message, time,scenario)
lib.progressCircle({
    duration = time,
    position = 'bottom',
    label = message,
    useWhileDead = false,
    canCancel = false,
    disable = {
      move = true,
      combat = true,
      mouse = false,
      car = true,
    },
    anim = {
      scenario = scenario
    }
  })
end

function progressbar3(message, time)
lib.progressCircle({
    duration = time,
    position = 'bottom',
    label = message,
    useWhileDead = false,
    canCancel = false,
    disable = {
      move = true,
      combat = true,
      mouse = false,
      car = true,
    },
  })
end

function obavesti(naslov,deskripcija,type,pozicija,vreme)
  lib.notify({
      title = naslov,
      description = deskripcija,
      type = type,
      position = pozicija,
      duration = vreme,
  })
end

function napraviBlipove()
  for i, v in pairs(Config.Lokacije) do
    if v.blip.koristi then
      local blip = AddBlipForCoord(v.blip.korde.x, v.blip.korde.y, v.blip.korde.z)

      SetBlipSprite(blip, v.blip.sprite)
      SetBlipAsShortRange(blip, true)
  
      SetBlipColour(blip, v.blip.boja)
  
      SetBlipDisplay(blip, 2)
  
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(v.blip.tekst)
      EndTextCommandSetBlipName(blip)
  
  
      local display = 2
  
      SetBlipDisplay(blip, display)
    else
      
    end
  end
end