# 🐱 dd-catcafe

Script completo de Cat Café para servidores FiveM, com sistema de crafting por estações, gatos interativos, sistema de assentos, loja de ingredientes e integração com os principais frameworks.

---

## Sobre

O **dd-catcafe** simula o funcionamento de um café temático de gatos dentro do GTA V. Funcionários preparam comidas e bebidas em estações específicas enquanto gatos reais circulam pelo estabelecimento. Clientes podem fazer carinho nos gatos, sentar nas mesas, comer, beber e até ficar bêbados com sake — com efeitos visuais incluídos.

---

## Funcionalidades

- Sistema de crafting por estações (tábua de corte, forno, fogão, café)
- Gatos animados espalhados pelo café com sistema de carinho interativo
- Sistema de assentos funcional com animação
- Loja de ingredientes via ox_inventory
- Múltiplos stashes (prateleira, geladeiras, balcões, mesas)
- Efeito de embriaguez ao consumir sake
- Buff de habilidades ao consumir certos alimentos (ps-buffs)
- Cobrança de clientes via jim-payments
- Sistema de entrada/saída de serviço (ponto)
- Blip no mapa ativo por padrão
- Zona de trabalho com saída automática de serviço ao sair da área

---

## Dependências

| Recurso | Link |
|---|---|
| qbx_core | https://github.com/Qbox-project/qbx_core |
| ox_inventory | https://github.com/overextended/ox_inventory |
| ox_target | https://github.com/overextended/ox_target |
| ox_lib | https://github.com/overextended/ox_lib |
| PolyZone | https://github.com/mkafrin/PolyZone |
| jim-payments | https://github.com/jimathy/jim-payments |
| ps-buffs *(opcional)* | https://github.com/Project-Sloth/ps-buffs |

---

## Estações de trabalho

| Estação | Ação |
|---|---|
| Tábua de Corte | Mochis, riceball, bento e purrito |
| Forno | Cookies, donuts, bolo, cakepop, panqueca e pizza |
| Fogão | Missô, ramen e tigela de macarrão |
| Café | Café, nekolatte, bobas e mocha |
| Geladeira / Geladeira 2 | Estoque de ingredientes (funcionários) |
| Prateleira | Comida preparada |
| Balcão / Balcão 2 | Atendimento e pedidos |
| Mesas 1–4 | Stash de mesa para clientes |
| Ponto | Entrar/sair de serviço |

---

## Cardápio

**Tábua de Corte**
- Mochi de Blueberry, Menta, Laranja e Morango
- Riceball, Bento, Purrito

**Forno**
- Neko Cookie, Donut, Bolo, Cakepop, Panqueca, Pizza

**Fogão**
- Missô, Ramen, Tigela de Macarrão

**Café**
- Café, Nekolatte
- Boba Tea (original, com açúcar, morango, laranja, peach)
- Mocha

**Bebida Alcoólica**
- Sake *(efeito de embriaguez com efeitos visuais)*

---

## Gatos

O café conta com **18 gatos** espalhados pelo mapa, cada um com posição e animação próprias. Gatos interativos permitem que o jogador faça carinho, recuperando vida e aliviando stress. Gatos aparecem e desaparecem dinamicamente conforme o jogador se aproxima ou se afasta.

---

## Instalação

Consulte o arquivo [INSTALL.md](./INSTALL.md) para instruções detalhadas de instalação, lista de itens e configuração do job.

---

## Configuração

Todas as opções ficam em `config.lua`:

```lua
Config.Debug = false             -- ativa logs de depuração
Config.PatHeal = 2               -- HP recuperado ao fazer carinho nos gatos
Config.Stashes = { ... }         -- stashes do café
Config.Items = { ... }           -- itens disponíveis na loja
Config.Locations = { ... }       -- zona e blip do café
Crafting.ChoppingBoard = { ... } -- receitas da tábua de corte
Crafting.Oven = { ... }          -- receitas do forno
Crafting.Coffee = { ... }        -- receitas do café
Crafting.Hob = { ... }           -- receitas do fogão
```

---

## Licença

Este projeto está licenciado sob a [GNU General Public License v3.0](./LICENSE).

---

## Créditos

Desenvolvido por **DUDU** — script de uso livre para servidores FiveM.