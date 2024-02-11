RegisterNetEvent('l_babice:naplati', function (cena)
    local igrac = ESX.GetPlayerFromId(source)
    if igrac then
        igrac.removeMoney(cena)
    else

    end
end)

ESX.RegisterServerCallback('l_babice:proveriNovac', function (source,cb,treba)
    local igrac = ESX.GetPlayerFromId(source)
    if igrac.getInventoryItem('money').count >= treba then
        cb(true)
    else
        cb(false)
    end
end)