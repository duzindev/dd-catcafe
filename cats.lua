local peds = {}
local shopPeds = {}
Citizen.CreateThread(function()
	for k, v in pairs(PedList) do
		if v.clickable then
			exports.ox_target:addBoxZone({
				coords = vector3(v.coords.x, v.coords.y, v.coords.z-0.3),
				size = vec3(0.7, 0.7, 1.0),
				rotation = 0,
				debug = Config.Debug,
				options = {
					{
						event = "dd-catcafe:CatPat",
						icon = "fas fa-paw",
						label = "Faça Carinho no Dudu",
						distance = 1.5
					}
				}
			})
		end
	end
	CreatePeds()
end)
RegisterNetEvent('dd-catcafe:CatPat')
AddEventHandler('dd-catcafe:CatPat', function()
	local pid = PlayerPedId()
	loadAnimDict("creatures@cat@amb@world_cat_sleeping_ground@exit")
	loadAnimDict("creatures@cat@amb@world_cat_sleeping_ground@enter")
	for k,v in pairs (shopPeds) do
        pCoords = GetEntityCoords(PlayerPedId())
        ppCoords = GetEntityCoords(v)
        dist = #(pCoords - ppCoords)
		if dist < 2 then
			TaskTurnPedToFaceEntity(pid, v, 1200)
			Wait(1200)
			if ppCoords.z < 22 then 
				TaskStartScenarioInPlace(pid, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
			elseif ppCoords.z > 22 then 
				lib.requestAnimDict('amb@world_human_crouch_inspect@male@idle_a')
				TaskPlayAnim(pid, 'amb@world_human_crouch_inspect@male@idle_a', 'idle_c', 8.0, -8.0, -1, 1, 0, false, false, false)
			end
			
			if lib.progressBar({
				duration = 10000,
				label = "Fazendo carinho no Dudu...",
				useWhileDead = false,
				canCancel = true,
				disable = {
					combat = true,
					move = true,
					car = true,
				},
			}) then
				ClearPedTasks(pid)
				FreezeEntityPosition(pid, true)
				TaskPlayAnim(v, "creatures@cat@amb@world_cat_sleeping_ground@exit", "exit", 1.0, 200.0, 0.3, 8, 0.2, 0, 0, 0) 
				Wait(4000)
				RemoveAnimDict("creatures@cat@amb@world_cat_sleeping_ground@exit")
				FreezeEntityPosition(v, false)
				TaskTurnPedToFaceEntity(v, pid, 1000)
				Wait(1000)
				FreezeEntityPosition(v, true)
				Wait(1500)
				if math.random(1,2) == 2 then
					loadAnimDict("creatures@cat@player_action@")
					TaskPlayAnim(v, "creatures@cat@player_action@", "action_a", 2.0, 200.0, 0.3, 8, 0.2, 0, 0, 0)
				end
				Wait(2000)
				FreezeEntityPosition(pid, false)
				TriggerServerEvent('hud:server:RelieveStress', 3)
				SetEntityHealth(pid, GetEntityHealth(pid) + Config.PatHeal)
				ClearPedTasks(pid)
				Wait(1000)
				TaskPlayAnim(v, "creatures@cat@amb@world_cat_sleeping_ground@enter", "enter", 2.0, 200.0, 0.3, 2, 0.2, 0, 0, 0)
				SetEntityCoords(v, ppCoords.x, ppCoords.y, ppCoords.z-0.23, 0, 0, 0, true)
			else
				ClearPedTasks(pid)
			end
			break
		end
	end
end)
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end
function CreatePeds()
	while true do
		Citizen.Wait(100)
		for k = 1, #PedList, 1 do
			v = PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			if dist < 40.0 and not peds[k] then
				local ped = nearPed("a_c_cat_01", v.coords, v.heading, "male", v.animDict, v.animName)
				peds[k] = {ped = ped}
			end
			if dist >= 40.0 and peds[k] then
				for i = 255, 0, -51 do
					Citizen.Wait(50)
					SetEntityAlpha(peds[k].ped, i, false)
				end
				DeletePed(peds[k].ped)
				peds[k] = nil
			end
		end
	end
end
function nearPed(model, coords, heading, gender, animDict, animName, scenario)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do Citizen.Wait(1) end
	local x, y, z = table.unpack(coords)
	ped = CreatePed(5, GetHashKey(model), x, y, z - 1, heading, false, true)
	table.insert(shopPeds, ped)
	SetEntityAlpha(ped, 0, false)
	if v.frozen then FreezeEntityPosition(ped, true)  end
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	if animDict and animName then loadAnimDict(animDict) TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0) end
	if v.wander then TaskWanderStandard(ped, 10.0, 10.0) end
	SetEntityNoCollisionEntity(ped, PlayerPedId(), false) 
	for i = 0, 255, 51 do Citizen.Wait(50) SetEntityAlpha(ped, i, false) end
	return ped
end
PedList = { 
	{ coords = vector3(-577.14, -1069.22, 22.99), heading = 0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vector3(-586.85, -1064.68, 23.35), heading = 0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vector3(-576.49, -1054.94, 22.42), heading = 350.0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vector3(-582.07, -1055.92, 22.43), heading = 250.0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vector3(-583.32, -1069.32, 22.99), heading = 90.0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vector3(-584.33, -1062.76, 23.40), heading = 223.0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true, },
	{ coords = vector3(-575.53, -1049.41, 23.53), heading = 90.0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true, },
	{ coords = vector3(-584.71, -1054.55, 23.33), heading = 280.0, animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", clickable = true, frozen = true },
	{ coords = vector3(-576.78, -1057.52, 25.15), heading = 0.0, animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vector3(-583.55, -1048.88, 25.50), heading = 240.0, animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vector3(-595.29, -1055.54, 22.43), heading = 180.0, animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vector3(-587.4, -1059.6, 23.3), heading = 180.0, animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", clickable = false, frozen = true },
	{ coords = vector3(-571.65, -1057.26, 22.54), heading = 90.0, animDict = "creatures@cat@move", animName = "gallop", clickable = false, frozen = true },
	{ coords = vector3(-573.78, -1052.5, 22.34), heading = 90.0, wander = true },
	{ coords = vector3(-582.57, -1059.72, 22.34), heading = 180.0, wander = true },
	{ coords = vector3(-582.35, -1050.91, 22.34), heading = 180.0, wander = true },
	{ coords = vector3(-585.55, -1067.99, 22.34), heading = 0.0, wander = true },
	{ coords = vector3(-578.73, -1051.92, 22.35), heading = 180.0, wander = true },
}

