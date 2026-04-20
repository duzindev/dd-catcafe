local QBCore = {
	Functions = {
		GetPlayerData = function()
			return exports.qbx_core:GetPlayerData()
		end
	},
	Shared = {
		Items = {},
		Jobs = {}
	}
}

CreateThread(function()
	local items = exports.ox_inventory:Items()
	for k, v in pairs(items) do
		QBCore.Shared.Items[k] = v
	end
end)

PlayerJob = {}
local onDuty = false
local alcoholCount = 0
local function installCheck()
	local items = { "bmochi", "pmochi", "gmochi", "omochi", "bobatea", "bbobatea", "gbobatea", "obobatea", "nekolatte", "sake",
					"miso", "cake", "bento", "riceball", "nekocookie", "donut", "boba", "flour", "rice", "sugar", "nori", "blueberry", "strawberry",
					"orange", "mint", "tofu", "mocha", "cakepop", "pancake", "pizza", "purrito", "noodlebowl", "noodles", "ramen", "milk", "onion" }
	if Config.Debug then print((#Config.Chairs).." Total seating locations") print((#items).." Items required") end
end
local function jobCheck()
	canDo = true
	--if not onDuty then exports.qbx_core:Notify("Você não bateu o ponto!", 'error') canDo = false end
	return canDo
end
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	installCheck()
	PlayerJob = QBCore.Functions.GetPlayerData().job
	if PlayerJob.onduty and PlayerJob.name == "catcafe" then
		TriggerServerEvent("QBCore:ToggleDuty")
	end
end)
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
	PlayerJob = JobInfo
	onDuty = PlayerJob.onduty
end)
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)
AddEventHandler('onResourceStart', function(resource)
	installCheck()
	if GetCurrentResourceName() == resource then
		local PlayerData = QBCore.Functions.GetPlayerData()
		if PlayerData and PlayerData.job then
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "catcafe" then onDuty = PlayerJob.onduty end
		end
	end
end)
CreateThread(function()
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "catcafe" then TriggerServerEvent("QBCore:ToggleDuty") end end)	
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			blip = AddBlipForCoord(Config.Locations[k].blip)	
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 621)
			SetBlipColour(blip, Config.Locations[k].blipcolor)
			SetBlipScale(blip, 0.9)
			SetBlipDisplay(blip, 6)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("Cat Café")
			EndTextCommandSetBlipName(blip)
		end
	end

	exports.ox_target:addBoxZone({ 
		coords = vector3(-587.4, -1059.6, 23.45), 
		size = vec3(2.0, 2.5, 2.0), 
		rotation = 270.0, 
		debug = Config.Debug,
		options = { { 
			event = "dd-catcafe:Stash", 
			icon = "fas fa-box-open", 
			label = "Comida Preparada", 
			stash = "Shelf", 
			distance = 2.0 } 
		} 
	})
	
	exports.ox_target:addBoxZone({ coords = vector3(-588.06, -1067.1, 22.34), size = vec3(3.5, 0.5, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-temperature-low", label = "Abrir Geladeira", stash = "Fridge", job = "catcafe", distance = 1.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-590.67, -1068.1, 22.34), size = vec3(2.0, 0.6, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-temperature-low", label = "Abrir Geladeira", stash = "Fridge2", job = "catcafe", distance = 1.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-598.0, -1068.47, 22.34), size = vec3(4.0, 1.5, 4.0), rotation = 90, debug = Config.Debug,
		options = { { event = "dd-catcafe:Shop", icon = "fas fa-box-open", label = "Abrir Loja", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-598.25, -1065.61, 22.34), size = vec3(4.0, 1.5, 4.0), rotation = 90, debug = Config.Debug,
		options = { { event = "dd-catcafe:Shop", icon = "fas fa-box-open", label = "Abrir Loja", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-598.31, -1062.79, 22.34), size = vec3(4.0, 1.5, 4.0), rotation = 90, debug = Config.Debug,
		options = { { event = "dd-catcafe:Shop", icon = "fas fa-box-open", label = "Abrir Loja", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-587.89, -1062.58, 22.36), size = vec3(0.7, 0.7, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:washHands", icon = "fas fa-hand-holding-water", label = "Lavar as Mãos", distance = 1.5 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-570.23, -1051.41, 22.34), size = vec3(0.5, 0.5, 1.2), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:washHands", icon = "fas fa-hand-holding-water", label = "Lavar as Mãos", distance = 1.2 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-570.25, -1056.98, 22.34), size = vec3(0.5, 0.5, 1.2), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:washHands", icon = "fas fa-hand-holding-water", label = "Lavar as Mãos", distance = 1.2 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-590.66, -1059.13, 22.34), size = vec3(2.5, 0.6, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Menu:Oven", icon = "fas fa-temperature-high", label = "Usar Forno", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-591.02, -1056.56, 22.36), size = vec3(1.5, 0.6, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Menu:Hob", icon = "fas fa-temperature-high", label = "Usar Fogão", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-584.01, -1059.27, 22.34), size = vec3(0.6, 0.6, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-hamburger", label = "Abrir Balcão", stash = "Counter", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-584.04, -1062.05, 22.34), size = vec3(0.6, 0.6, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-hamburger", label = "Abrir Balcão", stash = "Counter2", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-584.07, -1058.69, 22.34), size = vec3(0.5, 0.5, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Cobrar Cliente", job = "catcafe", 
			img = "<center><p><img src=https://i.imgur.com/03eA7N0.png width=100px></p>", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-584.09, -1061.47, 22.34), size = vec3(0.5, 0.5, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = "Cobrar Cliente", job = "catcafe",
			img = "<center><p><img src=https://i.imgur.com/03eA7N0.png width=100px></p>", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-586.8, -1061.89, 22.34), size = vec3(0.7, 0.5, 1.2), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Menu:Coffee", icon = "fas fa-mug-hot", label = "Servir Café", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-590.94, -1063.16, 22.36), size = vec3(1.5, 0.6, 4.0), rotation = 0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Menu:ChoppingBoard", icon = "fas fa-utensils", label = "Preparar Comida", job = "catcafe", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-573.43, -1059.76, 22.49), size = vec3(1.9, 1.0, 1.4), rotation = 91.0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-box-open", label = "Procurar na Mesa", stash = "Table_1", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-573.44, -1063.45, 22.34), size = vec3(1.9, 1.0, 1.4), rotation = 91.0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-box-open", label = "Procurar na Mesa", stash = "Table_2", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-573.41, -1067.09, 22.49), size = vec3(1.9, 1.0, 1.4), rotation = 91.0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-box-open", label = "Procurar na Mesa", stash = "Table_3", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-578.68, -1051.09, 22.35), size = vec3(1.2, 0.9, 1.4), rotation = 91.0, debug = Config.Debug,
		options = { { event = "dd-catcafe:Stash", icon = "fas fa-box-open", label = "Procurar na Mesa", stash = "Table_4", distance = 2.0 } } })
	
	exports.ox_target:addBoxZone({ coords = vector3(-594.34, -1053.35, 22.34), size = vec3(3.5, 0.5, 1.6), rotation = 0, debug = Config.Debug,
		options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Bater Ponto", job = "catcafe", distance = 2.0 } } })
end)
RegisterNetEvent('dd-catcafe:washHands', function()
    if lib.progressBar({
        duration = 5000,
        label = 'Lavando as mãos',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = "mp_arresting",
            clip = "a_uncuff",
            flag = 8,
        },
    }) then
        exports.qbx_core:Notify("Você lavou suas mãos!", 'success')
    else
        TriggerEvent('inventory:client:busy:status', false)
        exports.qbx_core:Notify("Cancelado", 'error')
    end
end)
RegisterNetEvent('dd-catcafe:MakeItem', function(data)
	if data.craftable then
		for k, v in pairs(data.craftable[data.tablenumber]) do
			lib.callback('dd-catcafe:get', false, function(amount)
				if not amount then exports.qbx_core:Notify("Você não tem os ingredientes corretos", 'error') else TriggerEvent("dd-catcafe:FoodProgress", data) end		
			end, data.item, data.tablenumber, data.craftable)
		end
	end
end)
RegisterNetEvent('dd-catcafe:Stash', function(data)
	exports.ox_inventory:openInventory('stash', { id = 'CatCafe_'..data.stash })
end)
RegisterNetEvent('dd-catcafe:Shop', function()
	exports.ox_inventory:openInventory('shop', { type = 'catcafe', id = 1 })
end)
RegisterNetEvent('dd-catcafe:FoodProgress', function(data)
	if lib.progressBar({
        duration = data.time,
        label = data.bartext..QBCore.Shared.Items[data.item].label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = data.animDict,
            clip = data.anim,
            flag = 8,
        },
    }) then
        TriggerServerEvent('dd-catcafe:GetFood', data)
        StopAnimTask(GetPlayerPed(-1), data.animDict, data.anim, 1.0)
    else
        TriggerEvent('inventory:client:busy:status', false)
        exports.qbx_core:Notify("Cancelado!", 'error')
    end
end)
RegisterNetEvent('dd-catcafe:Menu:ChoppingBoard', function()
	--if not jobCheck() then return end
	local ChopMenu = {
		id = 'chopping_menu',
		title = 'Tábua de Corte',
		options = {}
	}
	for i = 1, #Crafting.ChoppingBoard do
		for k, v in pairs(Crafting.ChoppingBoard[i]) do
			if k ~= "img" then
				local text = ""
				for l, b in pairs(Crafting.ChoppingBoard[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."\n"
				end
				ChopMenu.options[#ChopMenu.options + 1] = {
					title = QBCore.Shared.Items[k].label,
					description = text,
					event = "dd-catcafe:MakeItem",
					args = { item = k, tablenumber = i, craftable = Crafting.ChoppingBoard,
							 bartext = "Preparando ", time = 7000, animDict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_b_idle" }
				}
			end
		end
	end
	lib.registerContext(ChopMenu)
	lib.showContext('chopping_menu')
end)
RegisterNetEvent('dd-catcafe:Menu:Oven', function()
	--if not jobCheck() then return end
	local OvenMenu = {
		id = 'oven_menu',
		title = 'Menu do Forno',
		options = {}
	}
	for i = 1, #Crafting.Oven do
		for k, v in pairs(Crafting.Oven[i]) do
			if k ~= "img" then
				local text = ""
				for l, b in pairs(Crafting.Oven[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."\n"
				end
				OvenMenu.options[#OvenMenu.options + 1] = {
					title = QBCore.Shared.Items[k].label,
					description = text,
					event = "dd-catcafe:MakeItem",
					args = { item = k, tablenumber = i, craftable = Crafting.Oven,
							 bartext = "Preparando ", time = 5000, animDict = "amb@prop_human_bbq@male@base", anim = "base" }
				}
			end
		end
	end
	lib.registerContext(OvenMenu)
	lib.showContext('oven_menu')
end)
RegisterNetEvent('dd-catcafe:Menu:Coffee', function()
	--if not jobCheck() then return end
	local CoffeeMenu = {
		id = 'coffee_menu',
		title = 'Menu de Café',
		options = {}
	}
	for i = 1, #Crafting.Coffee do
		for k, v in pairs(Crafting.Coffee[i]) do
			if k ~= "img" then
				local text = ""
				for l, b in pairs(Crafting.Coffee[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."\n"
				end
				CoffeeMenu.options[#CoffeeMenu.options + 1] = {
					title = QBCore.Shared.Items[k].label,
					description = text,
					event = "dd-catcafe:MakeItem",
					args = { item = k, tablenumber = i, craftable = Crafting.Coffee,
							 bartext = "Servindo ", time = 3000, animDict = "mp_ped_interaction", anim = "handshake_guy_a" }
				}
			end
		end
	end
	lib.registerContext(CoffeeMenu)
	lib.showContext('coffee_menu')
end)
RegisterNetEvent('dd-catcafe:Menu:Hob', function()
	--if not jobCheck() then return end
	local HobMenu = {
		id = 'hob_menu',
		title = 'Menu do Fogão',
		options = {}
	}
	for i = 1, #Crafting.Hob do
		for k, v in pairs(Crafting.Hob[i]) do
			if k ~= "img" then
				local text = ""
				for l, b in pairs(Crafting.Hob[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."\n"
				end
				HobMenu.options[#HobMenu.options + 1] = {
					title = QBCore.Shared.Items[k].label,
					description = text,
					event = "dd-catcafe:MakeItem",
					args = { item = k, tablenumber = i, craftable = Crafting.Hob,
							 bartext = "Preparando ", time = 7000, animDict = "amb@prop_human_bbq@male@base", anim = "base" }
				}
			end
		end
	end
	lib.registerContext(HobMenu)
	lib.showContext('hob_menu')
end)
RegisterNetEvent('dd-catcafe:client:DrinkAlcohol', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_intdrink')
	TaskPlayAnim(ped, 'mp_player_intdrink', 'loop_bottle', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = math.random(3000, 6000),
        label = "Bebendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        ClearPedTasks(ped)
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
			AlienEffect()
        end
    else
        ClearPedTasks(ped)
        exports.qbx_core:Notify("Cancelado..", "error")
    end
end)
function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    local ped = PlayerPedId()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    SetPedCanRagdoll( ped, true )
    ShakeGameplayCam('DRUNK_SHAKE', 2.80)
    SetTimecycleModifier("Drunk")
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedMotionBlur(ped, true)
    SetPedIsDrunk(ped, true)
    Wait(1500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(13500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(120500)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    AnimpostfxStopAll()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(45000, 60000))    
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end
RegisterNetEvent('dd-catcafe:client:Drink', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('amb@world_human_drinking@coffee@male@idle_a')
	TaskPlayAnim(ped, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_c', 8.0, -8.0, -1, 49, 0, false, false, false)
	if lib.progressBar({
        duration = 5000,
        label = "Bebendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        ClearPedTasks(ped)
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
    end
end)
RegisterNetEvent('dd-catcafe:client:DrinkNeko', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('amb@world_human_drinking@coffee@male@idle_a')
	TaskPlayAnim(ped, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_c', 8.0, -8.0, -1, 49, 0, false, false, false)
	if lib.progressBar({
        duration = 5000,
        label = "Bebendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        ClearPedTasks(ped)
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
    end
end)
RegisterNetEvent('dd-catcafe:client:Eat', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_inteat@burger')
	TaskPlayAnim(ped, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = 5000,
        label = "Comendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        ClearPedTasks(ped)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
end)
RegisterNetEvent('dd-catcafe:client:Eat2', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_inteat@burger')
	TaskPlayAnim(ped, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = 5000,
        label = "Comendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        ClearPedTasks(ped)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
end)
RegisterNetEvent('dd-catcafe:client:Eat5', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_inteat@burger')
	TaskPlayAnim(ped, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = 5000,
        label = "Comendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        ClearPedTasks(ped)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
end)
RegisterNetEvent('dd-catcafe:client:Eat4', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_inteat@burger')
	TaskPlayAnim(ped, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = 5000,
        label = "Comendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        ClearPedTasks(ped)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        exports['ps-buffs']:AddBuff("hacking", 7200000, 1.4)
        exports['ps-buffs']:AddBuff("strength", 7200000, 1.4)
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
end)
RegisterNetEvent('dd-catcafe:client:Eat6', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_inteat@burger')
	TaskPlayAnim(ped, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = 5000,
        label = "Comendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        ClearPedTasks(ped)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
end)
RegisterNetEvent('dd-catcafe:client:Eat3', function(itemName)
	local ped = PlayerPedId()
	lib.requestAnimDict('mp_player_inteat@burger')
	TaskPlayAnim(ped, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8.0, -1, 49, 0, false, false, false)
    if lib.progressBar({
        duration = 5000,
        label = "Comendo "..QBCore.Shared.Items[itemName].label.."..",
        useWhileDead = false,
        canCancel = true,
        disable = {
            combat = true,
        },
    }) then
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        ClearPedTasks(ped)
        if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
        if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end
end)
AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then
	end
end)
