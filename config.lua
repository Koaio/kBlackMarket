Config = {}

Config.Debug = true -- if you want debug the script (print)

Config.Framework = {
    Version = 'new', -- old = esx version 1.1/1.2/base calif... // new = ESX Legacy 
    getSharedObject = 'esx:getSharedObject', -- change if your esx definition is not the same
    Resource = 'es_extended' -- change if your framework name is not the same
}

Config.Accounts = 'bank'

Config.MenuTitle = "BlackMarket"
Config.MenuDescription = "Voici les articles que je propose"

Config.MarkerType = 25 -- The type of marker you want (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerColor = { -- The color of the marker
    R = 255, -- Red
    G = 255, -- Green
    B = 255, -- Blue
}

Config.Distance = { 
    Marker = 5.0, -- The distance you can see the marker
    Interact = 1.0 -- The distance you can interact with it
}

Config.ListObjetsMenu = {
    {name = "weapon_pistol", label = "Pistolet", price = 10, description = "Permet de vous procurer une arme."},
    {name = "bandage", label = "Bandage", price = 100, description = "Permet de vous soigner lorsque vous êtes blessé."}
}

Config.ListObjetsSecurity = {
    ['weapon_pistol'] = {price = 10, label = 'Pistolet', type = 'weapon'},
    ['bandage'] = {price = 100, label = 'Bandage', type = 'item'}
}