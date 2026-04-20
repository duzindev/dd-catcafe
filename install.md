# DD-CatCafe - Qbox Edition

## 📋 Dependências Necessárias:
- **qbx_core** - Framework Qbox
- **ox_target** - Sistema de interação
- **ox_lib** - Biblioteca para menus e progress bars
- **ox_inventory** - Sistema de inventário
- **jim-payments** (opcional) - Sistema de pagamentos

## 📦 Instalação:
	
-------------------------------------------------------------------------------------------------

## 🔧 CONFIGURAÇÃO DOS ITENS

### Para Qbox com ox_inventory:

-- COMIDAS (Foods)
['bmochi'] = {
	label = 'Blue Mochi',
	weight = 100,
	stack = true,
	close = true,
	description = 'Delicioso mochi azul',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['pmochi'] = {
	label = 'Pink Mochi',
	weight = 100,
	stack = true,
	close = true,
	description = 'Delicioso mochi rosa',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['gmochi'] = {
	label = 'Green Mochi',
	weight = 100,
	stack = true,
	close = true,
	description = 'Delicioso mochi verde',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['omochi'] = {
	label = 'Orange Mochi',
	weight = 100,
	stack = true,
	close = true,
	description = 'Delicioso mochi laranja',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['cake'] = {
	label = 'Strawberry Cake',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bolo de morango delicioso',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['bento'] = {
	label = 'Bento Box',
	weight = 500,
	stack = true,
	close = true,
	description = 'Caixa bento tradicional',
	client = {
		status = { hunger = 300000 },
		usetime = 2500,
	}
},

['riceball'] = {
	label = 'Neko Onigiri',
	weight = 100,
	stack = true,
	close = true,
	description = 'Onigiri em formato de gato',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['nekocookie'] = {
	label = 'Neko Cookie',
	weight = 100,
	stack = true,
	close = true,
	description = 'Cookie em formato de gato',
	client = {
		status = { hunger = 150000 },
		usetime = 2500,
	}
},

['donut'] = {
	label = 'Neko Donut',
	weight = 100,
	stack = true,
	close = true,
	description = 'Donut decorado com tema de gato',
	client = {
		status = { hunger = 150000 },
		usetime = 2500,
	}
},

['miso'] = {
	label = 'Miso Soup',
	weight = 100,
	stack = true,
	close = true,
	description = 'Sopa de missô tradicional',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['cakepop'] = {
	label = 'Cake Pop',
	weight = 100,
	stack = true,
	close = true,
	description = 'Cake pop delicioso',
	client = {
		status = { hunger = 150000 },
		usetime = 2500,
	}
},

['pancake'] = {
	label = 'Pancake',
	weight = 100,
	stack = true,
	close = true,
	description = 'Panqueca fofinha',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['pizza'] = {
	label = 'Pizza',
	weight = 300,
	stack = true,
	close = true,
	description = 'Fatia de pizza',
	client = {
		status = { hunger = 250000 },
		usetime = 2500,
	}
},

['purrito'] = {
	label = 'Purrito',
	weight = 200,
	stack = true,
	close = true,
	description = 'Burrito temático de gato',
	client = {
		status = { hunger = 250000 },
		usetime = 2500,
	}
},

['noodlebowl'] = {
	label = 'Noodle Bowl',
	weight = 300,
	stack = true,
	close = true,
	description = 'Tigela de macarrão',
	client = {
		status = { hunger = 300000 },
		usetime = 2500,
	}
},

['noodles'] = {
	label = 'Noodles',
	weight = 200,
	stack = true,
	close = true,
	description = 'Macarrão',
	client = {
		status = { hunger = 200000 },
		usetime = 2500,
	}
},

['ramen'] = {
	label = 'Ramen',
	weight = 300,
	stack = true,
	close = true,
	description = 'Ramen tradicional',
	client = {
		status = { hunger = 300000 },
		usetime = 2500,
	}
},

-- BEBIDAS (Drinks)
['bobatea'] = {
	label = 'Boba Tea',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bubble tea',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

['bbobatea'] = {
	label = 'Blue Boba Tea',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bubble tea azul',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

['gbobatea'] = {
	label = 'Green Boba Tea',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bubble tea verde',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

['pbobatea'] = {
	label = 'Pink Boba Tea',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bubble tea rosa',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

['obobatea'] = {
	label = 'Orange Boba Tea',
	weight = 100,
	stack = true,
	close = true,
	description = 'Bubble tea laranja',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

['nekolatte'] = {
	label = 'Neko Latte',
	weight = 100,
	stack = true,
	close = true,
	description = 'Latte com arte de gato',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

['sake'] = {
	label = 'Sake',
	weight = 100,
	stack = true,
	close = true,
	description = 'Sake japonês',
	client = {
		status = { thirst = 150000, drunk = 50000 },
		usetime = 2500,
	}
},

['mocha'] = {
	label = 'Mocha',
	weight = 100,
	stack = true,
	close = true,
	description = 'Mocha quente',
	client = {
		status = { thirst = 200000 },
		usetime = 2500,
	}
},

-- INGREDIENTES (Ingredients)
['boba'] = {
	label = 'Boba',
	weight = 100,
	stack = true,
	close = false,
	description = 'Bolinhas de tapioca para bubble tea'
},

['flour'] = {
	label = 'Flour',
	weight = 100,
	stack = true,
	close = false,
	description = 'Farinha de trigo'
},

['rice'] = {
	label = 'Bowl of Rice',
	weight = 100,
	stack = true,
	close = false,
	description = 'Tigela de arroz',
	client = {
		status = { hunger = 100000 },
		usetime = 2500,
	}
},

['sugar'] = {
	label = 'Sugar',
	weight = 100,
	stack = true,
	close = false,
	description = 'Açúcar'
},

['nori'] = {
	label = 'Nori',
	weight = 100,
	stack = true,
	close = false,
	description = 'Alga marinha'
},

['blueberry'] = {
	label = 'Blueberry',
	weight = 100,
	stack = true,
	close = false,
	description = 'Mirtilo',
	client = {
		status = { hunger = 50000 },
		usetime = 2500,
	}
},

['strawberry'] = {
	label = 'Strawberry',
	weight = 100,
	stack = true,
	close = false,
	description = 'Morango',
	client = {
		status = { hunger = 50000 },
		usetime = 2500,
	}
},

['orange'] = {
	label = 'Orange',
	weight = 100,
	stack = true,
	close = false,
	description = 'Laranja',
	client = {
		status = { hunger = 50000 },
		usetime = 2500,
	}
},

['mint'] = {
	label = 'Mint',
	weight = 100,
	stack = true,
	close = false,
	description = 'Hortelã'
},

['tofu'] = {
	label = 'Tofu',
	weight = 150,
	stack = true,
	close = false,
	description = 'Tofu'
},

```lua
	--CATCAFE
	["bmochi"] 						= {["name"] = "bmochi",  	     			["label"] = "Blue Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochiblue.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["pmochi"] 						= {["name"] = "pmochi",  	     			["label"] = "Pink Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochipink.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["gmochi"] 						= {["name"] = "gmochi",  	     			["label"] = "Green Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochigreen.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["omochi"] 						= {["name"] = "omochi",  	     			["label"] = "Orange Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochiorange.png",		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	--Drinks
	["bobatea"] 					= {["name"] = "bobatea",  	     			["label"] = "Boba Tea",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbletea.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["bbobatea"] 					= {["name"] = "bbobatea",  	     			["label"] = "Blue Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteablue.png",	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["gbobatea"] 					= {["name"] = "gbobatea",  	     			["label"] = "Green Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteagreen.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pbobatea"] 					= {["name"] = "pbobatea",  	     			["label"] = "Pink Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteapink.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["obobatea"] 					= {["name"] = "obobatea",  	     			["label"] = "Orange Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteaorange.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },

	["nekolatte"] 					= {["name"] = "nekolatte",  	     		["label"] = "Neko Latte",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "latte.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	["sake"] 						= {["name"] = "sake",  	     				["label"] = "Sake",	 					["weight"] = 100, 		["type"] = "item", 		["image"] = "sake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	
	["miso"] 						= {["name"] = "miso",  	    	 			["label"] = "Miso Soup",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "miso.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["cake"] 						= {["name"] = "cake",  	     				["label"] = "Strawberry Cake",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "cake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["bento"] 						= {["name"] = "bento",  	     			["label"] = "Bento Box",		 		["weight"] = 500, 		["type"] = "item", 		["image"] = "bento.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	["riceball"] 					= {["name"] = "riceball",  	     			["label"] = "Neko Onigiri",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "catrice.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	
	["nekocookie"] 					= {["name"] = "nekocookie",  	     		["label"] = "Neko Cookie",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "catcookie.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["donut"] 					= {["name"] = "donut",  	     		["label"] = "Neko Donut",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "catdonut.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	
	--Ingredients
	["boba"] 						= {["name"] = "boba",  			     		["label"] = "Boba",	 					["weight"] = 100, 		["type"] = "item", 		["image"] = "boba.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["flour"] 						= {["name"] = "flour",  			     	["label"] = "Flour",					["weight"] = 100, 		["type"] = "item", 		["image"] = "flour.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["rice"] 						= {["name"] = "rice",  			     		["label"] = "Bowl of Rice",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "rice.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["sugar"] 						= {["name"] = "sugar",  			     	["label"] = "Sugar",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "sugar.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["nori"] 						= {["name"] = "nori",  			    	 	["label"] = "Nori",		 				["weight"] = 100, 		["type"] = "item", 		["image"] = "nori.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["blueberry"] 					= {["name"] = "blueberry",  			    ["label"] = "Blueberry",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "blueberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
['tofu'] = {
	label = 'Tofu',
	weight = 150,
	stack = true,
	close = false,
	description = 'Tofu'
},

['milk'] = {
	label = 'Milk',
	weight = 300,
	stack = true,
	close = true,
	description = 'Carton of Milk',
	client = {
		status = { thirst = 100000 },
		usetime = 2500,
	}
},

['onion'] = {
	label = 'Onion',
	weight = 500,
	stack = true,
	close = false,
	description = 'An onion'
},
```

**NOTA:** Você precisa adicionar TODOS os itens acima seguindo o padrão do ox_inventory. Os itens mostrados são exemplos. Adapte todos os outros itens seguindo o mesmo formato.

-------------------------------------------------------------------------------------------------

## 👔 CONFIGURAÇÃO DO EMPREGO (JOB)

Adicione no arquivo de jobs do Qbox (geralmente `qbx_core/shared/jobs.lua` ou similar):

```lua
catcafe = {
	label = 'Cat Cafe',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Recruit', payment = 50 },
		['1'] = { name = 'Novice', payment = 75 },
		['2'] = { name = 'Experienced', payment = 100 },
		['3'] = { name = 'Advanced', payment = 125 },
		['4'] = { name = 'Manager', isboss = true, payment = 150 },
	},
},
```

-------------------------------------------------------------------------------------------------

## 💼 CONFIGURAÇÃO DO BOSS MENU

**IMPORTANTE:** Para Qbox, o sistema de boss menu pode variar. Você pode usar um dos seguintes:

### Opção 1: qbx_management (Recomendado para Qbox)
Se estiver usando `qbx_management`, o boss menu será acessado automaticamente pelo script.

### Opção 2: Localização Manual
Se precisar configurar uma localização específica, escolha UMA das opções abaixo:

**Escritório no andar de baixo:**
```lua
vector3(-596.26, -1053.52, 21.85)
```

**Escritório no andar de cima (mais longe):**
```lua
vector3(-578.23, -1067.65, 26.12)
```

**Escritório no andar de cima (mais próximo):**
```lua
vector3(-579.1, -1061.28, 26.11)
```

-------------------------------------------------------------------------------------------------

## 🖼️ IMAGENS

Certifique-se de que todas as imagens dos itens estão na pasta de imagens do seu inventário:
- `ox_inventory/web/images/` (para ox_inventory)

As imagens necessárias estão incluídas no pacote do script.

-------------------------------------------------------------------------------------------------

## ✅ CHECKLIST DE INSTALAÇÃO

- [ ] Script dd-catcafe colocado em `resources/[scripts]/[empregos]/`
- [ ] Dependências instaladas (qbx_core, ox_target, ox_lib, ox_inventory)
- [ ] Todos os itens adicionados ao ox_inventory
- [ ] Job 'catcafe' adicionado ao sistema de jobs
- [ ] Imagens dos itens copiadas para a pasta do inventário
- [ ] Server.cfg atualizado com `ensure dd-catcafe`
- [ ] Servidor reiniciado completamente

-------------------------------------------------------------------------------------------------

## 🎮 COMANDOS E FUNCIONALIDADES

- **Bater Ponto:** Interaja com o local de clock-in no café
- **Preparar Comida:** Use as estações de trabalho (forno, fogão, tábua de corte)
- **Servir Bebidas:** Use a máquina de café
- **Acariciar Gatos:** Interaja com os gatos para aliviar stress
- **Cobrar Clientes:** Use o sistema jim-payments nos balcões

-------------------------------------------------------------------------------------------------

## 🐛 SUPORTE

Em caso de problemas:
1. Verifique se todas as dependências estão instaladas
2. Confira os erros no console F8 e no console do servidor
3. Certifique-se de que todos os itens foram adicionados corretamente
4. Verifique se o job foi configurado corretamente



