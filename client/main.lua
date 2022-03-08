local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- dont edit
RegisterNetEvent('police:client:SaveCar', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)

    if veh ~= nil and veh ~= 0 then
        local plate = QBCore.Functions.GetPlate(veh)
        local props = QBCore.Functions.GetVehicleProperties(veh)
        local hash = props.model
        local vehname = GetDisplayNameFromVehicleModel(hash):lower()
        if QBCore.Shared.Vehicles[vehname] ~= nil and next(QBCore.Shared.Vehicles[vehname]) ~= nil then
            TriggerServerEvent('police:server:SaveCarData', props, QBCore.Shared.Vehicles[vehname], `veh`, plate)
        else
            QBCore.Functions.Notify('You cant store this vehicle in your garage..', 'error')
        end
    else
        QBCore.Functions.Notify('You are not in a vehicle..', 'error')
    end
end)


RegisterNetEvent('police:client:garage')
AddEventHandler('police:client:garage', function(pd)
    local vehicle = pd.vehicle
    local ped = PlayerPedId()
    local coords = vector4(436.27, -976.04, 25.7, 89.44)
    local key = pd.key
    local veh = GetVehiclePedIsIn(ped, false)

    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(vehicle, plate)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetEntityHeading(vehicle, heading)
        SetVehicleEngineOn(veh, true, true)
        SetVehicleModKit(veh, 0)
    end, coords, true)
    Wait(200)
    TriggerEvent('police:client:SaveCar')
    TriggerServerEvent('police:server:takekey', key)
end)

RegisterNetEvent('npolvic:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolvic')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolvic')
AddEventHandler('police:client:npolvic', function()
        local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolvic,
                            key = Config.vehicle.npolvic
                        }
                    }
                },
                {
                    id = 2,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)

RegisterNetEvent('npolchar:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolchar')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolchar')
AddEventHandler('police:client:npolchar', function()
            local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolchar,
                            key = Config.vehicle.npolchar
                        }
                    }
                },
                {
                    id = 3,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)

RegisterNetEvent('npolblazer:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolblazer')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolblazer')
AddEventHandler('police:client:npolblazer', function()
            local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolblazer,
                            key = Config.vehicle.npolblazer
                        }
                    }
                },
                {
                    id = 2,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)

RegisterNetEvent('npolchal:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolchal')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolchal')
AddEventHandler('police:client:npolchal', function()
            local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolchal,
                            key = Config.vehicle.npolchal
                        }
                    }
                },
                {
                    id = 2,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)

RegisterNetEvent('npolmm:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolmm')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolmm')
AddEventHandler('police:client:npolmm', function()
            local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolmm,
                            key = Config.vehicle.npolmm
                        }
                    }
                },
                {
                    id = 2,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)

RegisterNetEvent('npolstang:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolstang')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolstang')
AddEventHandler('police:client:npolstang', function()
            local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolstang,
                            key = Config.vehicle.npolstang
                        }
                    }
                },
                {
                    id = 2,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)


RegisterNetEvent('npolvette:coords', function ()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped) 
    local dist = GetDistanceBetweenCoords(pos, 435.74, -976.47, 25.7, 327.54) 

    if dist < 1.8 then
    TriggerEvent('police:client:npolvette')
        else
            QBCore.Functions.Notify('you are not in the right place', 'error')
    end
end)

RegisterNetEvent('police:client:npolvette')
AddEventHandler('police:client:npolvette', function()
            local myMenu = {
                {
                    id = 1,
                    header = "< spawn",
                    txt = "make sure you are in free space",
                    params = {
                        event = "police:client:garage", --- event name
                        args = {
                            vehicle = Config.vehicle.npolvette,
                            key = Config.vehicle.npolvette
                        }
                    }
                },
                {
                    id = 2,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)


RegisterNetEvent('police:client:GiveCarKey', function(pd)
   local money = pd.money
   local key = pd.key 

   TriggerServerEvent('police:server:buykey', money, key)
end)
    

RegisterNetEvent('police:client:KeysMenu')
AddEventHandler('police:client:KeysMenu', function()
            local myMenu = {
                {
                    id = 1,
                    header = 'police vehicle shop'
                },
                {
                    id = 2,
                    header = "< buy",
                    txt = "police ford vic (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- money remove and add item
                        args = {
                            money = Config.cost.npolvic, -- cost of the car
                            key = Config.vehicle.npolvic -- name of the item
                        }
                    }
                },
                {
                    id = 3,
                    header = "< buy",
                    txt = "police dodge charger (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- event name
                        args = {
                            money = Config.cost.npolchar,
                            key = Config.vehicle.npolchar
                        }
                    }
                },
                {
                    id = 4,
                    header = "< buy",
                    txt = "police off road bike (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- event name
                        args = {
                            money = Config.cost.npolblazer,
                            key = Config.vehicle.npolblazer
                        }
                    }
                },
                {
                    id = 5,
                    header = "< buy",
                    txt = "police dodge hellcat (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- event name
                        args = {
                            money = Config.cost.npolchal,
                            key = Config.vehicle.npolchal
                        }
                    }
                },
                {
                    id = 6,
                    header = "< buy",
                    txt = "police bike (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- event name
                        args = {
                            money = Config.cost.npolmm,
                            key = Config.vehicle.npolmm
                        }
                    }
                },
                {
                    id = 7,
                    header = "< buy",
                    txt = "police ford mustang (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- event name
                        args = {
                            money = Config.cost.npolstang,
                            key = Config.vehicle.npolstang
                        }
                    } 
                },
                {
                    id = 8,
                    header = "< buy",
                    txt = "police c7 (key)",
                    params = {
                        event = "police:client:GiveCarKey", --- event name
                        args = {
                            money = Config.cost.npolvette,
                            key = Config.vehicle.npolvette
                        }
                    }
                },
                {
                    id = 9,
                    header = '< close',
                    txt = '',
                    params = {
                        event = '',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)



