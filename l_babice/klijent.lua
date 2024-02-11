napraviBlipove()
local ozivljavase = false
local mrtav = false

Citizen.CreateThread(function ()
  for k,v in pairs(Config.Lokacije) do
      RequestModel(GetHashKey(v.ped.hash))
      while not HasModelLoaded(GetHashKey(v.ped.hash)) do
        Wait(500)
      end
      Ped = CreatePed(4, v.ped.hash, vector3(v.ped.korde.x, v.ped.korde.y, v.ped.korde.z - 1) , v.ped.korde.w, false, true)
      TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND", 0, true)
      FreezeEntityPosition(Ped, true) 
      SetEntityInvincible(Ped, true)
      SetBlockingOfNonTemporaryEvents(Ped, true)
      exports.qtarget:AddBoxZone('prodavac', vector3(v.ped.korde.x, v.ped.korde.y, v.ped.korde.z - 1), v.ped.korde.w, 1.0, {
          name= 'prodavac',
          heading= v.ped.korde.w,
          debugPoly=false,
          minZ= v.ped.korde.z -1,
          maxZ= v.ped.korde.z +2,
          }, {
          options = {
              {
              action = function()
                if not ozivljavase then
                  if mrtav then
                    ESX.TriggerServerCallback('l_babice:proveriNovac', function (ima)
                      if ima then
                        ozivljavase = true
                        ESX.Streaming.RequestAnimDict('mini@cpr@char_a@cpr_str', function ()
                          TaskPlayAnim(Ped, 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', 8.0, -8.0, -1, 2, 0, false, false, false)
                        end)
                        progressbar3('Doktor vas ozivljava...',v.revVreme * 1000)
                        ClearPedTasks(Ped)
                        TriggerEvent('esx_ambulancejob:revive')
                        TriggerServerEvent('l_babice:naplati', v.cena)
                        ozivljavase = false
                        mrtav = false
                      else
                        obavesti('l_babice','Nemate dovoljno novca potrebno vam je '..v.cena..'$','error','top',2000)
                      end
                    end, v.cena)
                  else
                    obavesti('l_babice','Niste mrtvi','error','top',2000)
                  end
                else
                  obavesti('l_babice','Vec se ozivljavate','inform','top',2000)
                end
              end,
              icon = v.ped.targetIkonica,
              label = v.ped.tekst, 
              },
          },
          distance = 2.0
      })
  end
end)

AddEventHandler('playerSpawned', function(spawn) mrtav = false end)
AddEventHandler('esx:onPlayerDeath', function(data) mrtav = true end)