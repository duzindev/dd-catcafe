local ox = exports.ox_inventory

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end

	for _, stash in pairs(Config.Stashes) do
		ox:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, false)
	end

	local shopItems = {}
	for k, v in pairs(Config.Items.items) do
		table.insert(shopItems, {
			name = v.name,
			price = v.price,
			count = v.amount,
			currency = 'money'
		})
	end
	
	exports.ox_inventory:RegisterShop('catcafe', {
		name = 'Cat Cafe - Ingredientes',
		inventory = shopItems
	})
end)

CreateThread(function()
	local qbx = exports.qbx_core
	
	local food = { "bento", "blueberry", "donut", "miso", "strawberry", "rice", "noodlebowl", "ramen" }
    for k,v in pairs(food) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Eat6', source, item.name) end) end
	local food2 = { "bmochi", "pmochi", "gmochi", "omochi" }
    for k,v in pairs(food2) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Eat2', source, item.name) end) end
	local food3 = { "purrito" }
    for k,v in pairs(food3) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Eat3', source, item.name) end) end
	local food4 = { "nekocookie", "pizza", "pancake", "cakepop" }
    for k,v in pairs(food4) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Eat4', source, item.name) end) end
	local food5 = { "cake" }
    for k,v in pairs(food5) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Eat5', source, item.name) end) end
	local food6 = { "riceball" }
    for k,v in pairs(food6) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Eat6', source, item.name) end) end
	local drinks = { "bobatea", "bbobatea", "gbobatea", "pbobatea", "obobatea", "mocha" }
    for k,v in pairs(drinks) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:Drink', source, item.name) end) end
	local drinkss = { "nekolatte" }
    for k,v in pairs(drinkss) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:DrinkNeko', source, item.name) end) end
	local alcohol = { "sake" }
    for k,v in pairs(alcohol) do qbx:CreateUseableItem(v, function(source, item) TriggerClientEvent('dd-catcafe:client:DrinkAlcohol', source, item.name) end) end
end)
RegisterServerEvent('dd-catcafe:GetFood', function(data)
	local src = source
    local Player = exports.qbx_core:GetPlayer(src)
	amount = 1
	
	if data.craftable ~= nil then

		for k, v in pairs(data.craftable[tonumber(data.tablenumber)][tostring(data.item)]) do
			if v > 0 then
				local count = ox:GetItemCount(src, k)
				if count < v then
					TriggerClientEvent('ox_lib:notify', src, {description = 'Faltam ingredientes', type = 'error'})
					return
				end
			end
		end

		for k, v in pairs(data.craftable[tonumber(data.tablenumber)][tostring(data.item)]) do
			if Config.Debug then print("GetFood Table Result: craftable["..data.tablenumber.."]['"..data.item.."']["..k.."]["..v.."]") end	
			if v > 0 then
				ox:RemoveItem(src, tostring(k), v)
			end
		end
		if data.craftable[tonumber(data.tablenumber)]["amount"] ~= nil then amount = data.craftable[tonumber(data.tablenumber)]["amount"] else amount = 1 end
	end
	
	ox:AddItem(src, data.item, amount)
	if Config.Debug then print("Giving ["..src.."]: x"..amount.." "..data.item) end		
end)
lib.callback.register('dd-catcafe:get', function(source, item, tablenumber, craftable)
	local src = source
	local hasAllItems = true
	
	for k, v in pairs(craftable[tonumber(tablenumber)][tostring(item)]) do
		local count = ox:GetItemCount(src, k)
		if count < v then
			hasAllItems = false
			if Config.Debug then print("craftable["..tablenumber.."]['"..item.."']["..k.."]["..v.."] = false ("..count..")") end
			break
		else
			if Config.Debug then print("craftable["..tablenumber.."]['"..item.."']["..k.."]["..v.."] = true ("..count..")") end
		end
	end
	
	return hasAllItems
end)
