Config = {}
Config.Debug = false

Config.link = "ox_inventory/web/images/"

Config.PatHeal = 2

-- Stash Configurations
Config.Stashes = {
    { id = 'CatCafe_Shelf', label = 'Prateleira', slots = 15, weight = 50000 },
    { id = 'CatCafe_Fridge', label = 'Geladeira', slots = 20, weight = 75000 },
    { id = 'CatCafe_Fridge2', label = 'Geladeira 2', slots = 20, weight = 75000 },
    { id = 'CatCafe_Counter', label = 'Balcão', slots = 10, weight = 25000 },
    { id = 'CatCafe_Counter2', label = 'Balcão 2', slots = 10, weight = 25000 },
    { id = 'CatCafe_Table_1', label = 'Mesa 1', slots = 5, weight = 10000 },
    { id = 'CatCafe_Table_2', label = 'Mesa 2', slots = 5, weight = 10000 },
    { id = 'CatCafe_Table_3', label = 'Mesa 3', slots = 5, weight = 10000 },
    { id = 'CatCafe_Table_4', label = 'Mesa 4', slots = 5, weight = 10000 },
}		
							

Config.Items = {
    label = "Ingredients Storage",
    slots = 14,
    items = {
        [1] = { name = "sugar", price = 550, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "flour", price = 350, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "nori", price = 240, amount = 22, info = {}, type = "item", slot = 3, },
        [4] = { name = "tofu", price = 80, amount = 6, info = {}, type = "item", slot = 4, },
        [5] = { name = "onion", price = 60, amount = 12 , info = {}, type = "item", slot = 5, },
        [6] = { name = "boba", price = 369, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "mint", price = 45, amount = 6, info = {}, type = "item", slot = 7, },
        [8] = { name = "orange", price = 35, amount = 5, info = {}, type = "item", slot = 8, },
        [9] = { name = "strawberry", price = 35, amount = 5, info = {}, type = "item", slot = 9, },
        [10] = { name = "blueberry", price = 35, amount = 5, info = {}, type = "item", slot = 10, },
        [11] = { name = "milk", price = 350, amount = 50, info = {}, type = "item", slot = 11, },
        [12] = { name = "rice", price = 500, amount = 50, info = {}, type = "item", slot = 12, },
        [13] = { name = "sake", price = 360, amount = 18, info = {}, type = "item", slot = 13, },
        [14] = { name = "noodles", price = 340, amount = 36, info = {}, type = "item", slot = 14, },
    },
}

Config.Locations = {
    [1] = {
		zoneEnable = true,
        label = "catcafe",
        zones = {
		  vector2(-591.15808105469, -1087.8620605469),
		  vector2(-563.33447265625, -1087.8508300781),
		  vector2(-563.26678466797, -1045.1898193359),
		  vector2(-618.20904541016, -1044.2902832031),
		  vector2(-617.80517578125, -1079.7291259766),
		  vector2(-599.44097900391, -1079.6105957031)
        },
		blip = vector3(-581.06, -1066.22, 22.34),
		blipcolor = 48,
    },
}

Crafting = {}

Crafting.ChoppingBoard = {
	[1] = { ['bmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['blueberry'] = 1, }, },
	[2] = { ['gmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['mint'] = 1, }, },
	[3] = { ['omochi'] = { ['sugar'] = 1, ['flour'] = 1, ['orange'] = 1, }, },
	[4] = { ['pmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['strawberry'] = 1, }, },
	[5] = { ['riceball'] = { ['rice'] = 1, ['nori'] = 1, }, },
	[6] = { ['bento'] = { ['rice'] = 1, ['nori'] = 1, ['tofu'] = 1, }, },
	[7] = { ['purrito'] = { ['rice'] = 1, ['flour'] = 1, ['onion'] = 1, }, },
}

Crafting.Oven = {
	[1] = { ['nekocookie'] = { ['flour'] = 1, ['milk'] = 1, }, },
	[2] = { ['donut'] = { ['flour'] = 1, ['milk'] = 1, }, },
	[3] = { ['cake'] = { ['flour'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },	
	[4] = { ['cakepop'] = { ['flour'] = 1, ['milk'] = 1, ['sugar'] = 1, }, },
	[5] = { ['pancake'] = { ['flour'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
	[6] = { ['pizza'] = { ['flour'] = 1, ['milk'] = 1, }, },
}

Crafting.Coffee = {
	[1] = { ['coffee'] = { ['milk'] = 1, ['sugar'] = 1, }, },
	[2] = { ['nekolatte'] = { ['milk'] = 1, ['sugar'] = 1, }, },
	[3] = { ['bobatea'] = { ['boba'] = 1, ['milk'] = 1, }, },
	[4] = { ['bbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['sugar'] = 1, }, },
	[5] = { ['gbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
	[6] = { ['obobatea'] = { ['boba'] = 1, ['milk'] = 1, ['orange'] = 1, }, },
	[7] = { ['pbobatea'] = { ['boba'] = 1, ['milk'] = 1, ['strawberry'] = 1, }, },
	[8] = { ['mocha'] = { ['milk'] = 1, ['sugar'] = 1, }, },
}

Crafting.Hob = {
	[1] = { ['miso'] = { ['nori'] = 1, ['tofu'] = 1, ['onion'] = 1, }, },
	[2] = { ['ramen'] = { ['noodles'] = 1, ['onion'] = 1, }, },
	[3] = { ['noodlebowl'] = { ['noodles'] = 1, }, },
}
