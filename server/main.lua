local QBCore = exports['arabcodingteam-core']:GetCoreObject()

-- dont edit
RegisterServerEvent('police:server:SaveCarData', function(mods, vehicle, hash, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = exports.oxmysql:executeSync('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result[1] == nil then
        exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            vehicle.model,
            vehicle.hash,
            json.encode(mods),
            plate,
            0
        })
        TriggerClientEvent('QBCore:Notify', src, 'The vehicle is now yours!', 'success', 5000)
    else
        TriggerClientEvent('QBCore:Notify', src, 'This vehicle is already yours..', 'error', 3000)
    end
end)


RegisterServerEvent('police:server:buykey', function(money, key)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bank = Player.Functions.GetMoney('bank')

    if tonumber(money) <= bank then
        Player.Functions.RemoveMoney('bank', money)
        Player.Functions.AddItem(key, 1)
        TriggerClientEvent('QBCore:Notify', source, "Payed $" .. money .. " for car key check your invntory")
    else 
        TriggerClientEvent('QBCore:Notify', source, "You dont have enough money", "error")
    end
end)

RegisterServerEvent('police:server:takekey', function(key)
    local Player = QBCore.Functions.GetPlayer(source)

        Player.Functions.RemoveItem(key, 1, false, info)
end)

--- keys for cars 

QBCore.Functions.CreateUseableItem("npolvic", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolvic:coords", source)
    end
end)

QBCore.Functions.CreateUseableItem("npolstang", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolstang:coords", source)
    end
end)

QBCore.Functions.CreateUseableItem("npolchal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolchal:coords", source)
    end
end)

QBCore.Functions.CreateUseableItem("npolvette", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolvette:coords", source)
    end
end)

QBCore.Functions.CreateUseableItem("npolchar", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolchar:coords", source)
    end
end)

QBCore.Functions.CreateUseableItem("npolmm", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolmm:coords", source)
    end
end)

QBCore.Functions.CreateUseableItem("npolblazer", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("npolblazer:coords", source)
    end
end)
