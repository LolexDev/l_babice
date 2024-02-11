ESX.RegisterServerCallback('l_babice:proveriNovac', function (source,cb,treba)
    local igrac = ESX.GetPlayerFromId(source)
    if igrac.getInventoryItem('money').count >= treba then
        igrac.removeMoney(treba)
        cb(true)
    else
        cb(false)
    end
end)
