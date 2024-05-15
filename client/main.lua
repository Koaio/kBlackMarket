ESX = nil

if Config.Framework.Version == 'old' then
    TriggerEvent(Config.Framework.getSharedObject, function(obj) ESX = obj end)
elseif Config.Framework.Version == 'new' then
    ESX = exports[Config.Framework.Resource]:getSharedObject()
end

local BlackMarket = {
    ["zones"] = nil,
    ["isProche"] = false
}

RegisterNetEvent('koaio:blackmarket:initPoints')
AddEventHandler('koaio:blackmarket:initPoints', function(zoneBM)
    BlackMarket["zones"] = zoneBM
end)

Citizen.CreateThread(function()
    TriggerServerEvent('koaio:blackmarket:initPoints')

    while true do
        if BlackMarket["isProche"] then
            Wait(0)
        else
            Wait(1500)
        end

        local dist = #(GetEntityCoords(PlayerPedId()) - BlackMarket["zones"])
        if dist < Config.Distance.Marker then
            BlackMarket["isProche"] = true
            DrawMarker(Config.MarkerType, BlackMarket["zones"].x, BlackMarket["zones"].y, BlackMarket["zones"].z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, Config.MarkerColor.R , Config.MarkerColor.G, Config.MarkerColor.B, 255, false, false, 2, false, false, false, false)
        end
        if dist < Config.Distance.Interact then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
            if IsControlJustPressed(1, 51) then
                BlackMarketMenu()
            end
        end
    end
end)

function BlackMarketMenu()
    local menu = RageUI.CreateMenu(Config.MenuTitle, Config.MenuDescription)
    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
            for k,v in pairs(Config.ListObjetsMenu) do
                RageUI.Button(v.label, v.description, {RightLabel = v.price.."$"}, true, {
                    onSelected = function()
                        TriggerServerEvent("koaio:blackmarket:buy", v.name, v.type)
                    end
                })
            end
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end