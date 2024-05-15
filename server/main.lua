ESX = nil

if Config.Framework.Version == 'old' then
    TriggerEvent(Config.Framework.getSharedObject, function(obj) ESX = obj end)
elseif Config.Framework.Version == 'new' then
    ESX = exports[Config.Framework.Resource]:getSharedObject()
end

ZonesBM = {
    [1] = vector3(790.01647949219,4183.9404296875,41.563827514648),
    [2] = vector3(2641.68359375,4235.400390625,45.492984771729),
    [3] = vector3(1861.9290771484,3857.1918945313,36.271461486816),
    [4] = vector3(906.37213134766,3655.1616210938,32.560276031494),
    [5] = vector3(790.01647949219,4183.9404296875,41.563827514648),
    [6] = vector3(752.99786376953,-3192.0202636719,6.0731544494629),
    [7] = vector3(3.9195139408112,-200.81262207031,52.741859436035),
    [8] = vector3(-1375.5947265625,-336.29382324219,38.898422241211),
    [9] = vector3(-1349.3492431641,-945.53314208984,9.7058153152466),
    [10] = vector3(1099.3575439453,-345.83197021484,67.18342590332)
}

local zones = ZonesBM[math.random(1,10)]

RegisterNetEvent('koaio:blackmarket:initPoints')
AddEventHandler('koaio:blackmarket:initPoints', function()
    TriggerClientEvent('koaio:blackmarket:initPoints', source, zones)
end)

RegisterNetEvent('koaio:blackmarket:buy')
AddEventHandler('koaio:blackmarket:buy', function(item, type)
    if Config.ListObjetsSecurity[item] == nil then return DropPlayer(source, "Tentative de triche avec le BlackMarket.") end
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.ListObjetsSecurity[item].type == 'item' then
        if xPlayer.canCarryItem(item, 1) then
            if xPlayer.getAccount(Config.Accounts).money >= Config.ListObjetsSecurity[item].price then
                xPlayer.removeAccountMoney(Config.Accounts, Config.ListObjetsSecurity[item].price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(("Vous avez acheté %s pour %s$"):format(Config.ListObjetsSecurity[item].label, Config.ListObjetsSecurity[item].price))
            else
                xPlayer.showNotification("Vous n'avez pas assez d'argent pour payer cette objet.")
            end
        else
            xPlayer.showNotification("Vous avez trop d'objets sur vous.")
        end
    elseif Config.ListObjetsSecurity[item].type == 'weapon' then
        if xPlayer.getAccount(Config.Accounts).money >= Config.ListObjetsSecurity[item].price then
            xPlayer.removeAccountMoney(Config.Accounts, Config.ListObjetsSecurity[item].price)
            xPlayer.addWeapon(item, 250)
            xPlayer.showNotification(("Vous avez acheté %s pour %s$"):format(Config.ListObjetsSecurity[item].label, Config.ListObjetsSecurity[item].price))
        else
            xPlayer.showNotification("Vous n'avez pas assez d'argent pour payer cette arme.")
        end
    end
end)


if Config.Debug then
    Citizen.CreateThread(function()
        Wait(1000)
        print("Le blackmarket se situe a cette coordonnée : "..zones)
    end)
end