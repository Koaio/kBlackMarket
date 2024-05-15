Config = {}

Config.Debug = true -- Si vous voulez déboguer le script (print)

Config.Framework = {
    Version = 'new', -- old = esx version 1.1/1.2/base calif... // new = ESX Legacy 
    getSharedObject = 'esx:getSharedObject', -- Changez si votre définition ESX n'est pas la même.
    Resource = 'es_extended' -- Changez si le nom de votre framework n'est pas le même.
}

Config.Accounts = 'bank'

Config.MenuTitle = "BlackMarket"
Config.MenuDescription = "Voici les articles que je propose"

Config.MarkerType = 25 -- Le type de marker que vous souhaitez. (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerColor = { -- La couleur du marker
    R = 255, -- Rouge
    G = 255, -- Vert
    B = 255, -- Bleu
}

Config.Distance = { 
    Marker = 5.0, -- La distance à laquelle vous pouvez voir le marker.
    Interact = 1.0 -- La distance à laquelle vous pouvez interagir avec lui
}

Config.ListObjetsMenu = {
    {name = "weapon_pistol", label = "Pistolet", price = 10, description = "Permet de vous procurer une arme."},
    {name = "bandage", label = "Bandage", price = 100, description = "Permet de vous soigner lorsque vous êtes blessé."}
}

Config.ListObjetsSecurity = {
    ['weapon_pistol'] = {price = 10, label = 'Pistolet', type = 'weapon'},
    ['bandage'] = {price = 100, label = 'Bandage', type = 'item'}
}
