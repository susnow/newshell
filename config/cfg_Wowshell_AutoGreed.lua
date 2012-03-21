local L = setmetatable(GetLocale() == 'zhCN' and {
    ['Auto Greed'] = '自动贪婪',
    ['Auto greed stuff in instance'] = '自动在无法选择需求的时候选择贪婪(或分解)',
    ['|cff33ff99AutoGreed: %s >> %s'] = '|cff33ff99自动贪婪: %s >> %s',
    ['Enabled'] = '启用',
    ['BOP only'] = '只贪婪拾取绑定物品',
    ['Five men only'] = '只在5人副本启用',
    ['Price limit'] = '价格上限',
    ['Items whose sell price higher than this will NOT be rolled disenchant'] = '任何高于此上限的物品都不会被选择分解',
} or GetLocale() == 'zhTW' and {
    ['Auto Greed'] = '自動貪婪',
    ['Auto greed stuff in instance'] = '自動在無法選擇需求情況下選擇貪婪(或分解)',
    ['|cff33ff99AutoGreed: %s >> %s'] = '|cff33ff99自動貪婪: %s >> %s',
    ['Enabled'] = '啟用',
    ['BOP only'] = '只貪婪拾取綁定物品',
    ['Five men only'] = '只在5人副本啟用',
    ['Price limit'] = '價格上限',
    ['Items whose sell price higher than this will NOT be rolled disenchant'] = '任何高於此上限的物品都不會被選擇分解',
} or {}, {__index = function(t, i) return i end})

local _____ = 0
local o = function()
		_____ = _____ + 1
		return _____
end

wsRegisterOption(
		'general',
		'Wowshell_AutoGreed',
		'wsAutoGreed',
		L['Auto Greed'],
		L['Auto greed stuff in instance'],
		[[Interface\Icons\spell_fire_masterofelements]],
		{
				type = 'group',
				args = {
					enabled = {
						order = o(),
						type = 'toggle',
						name = L['Enabled'],
						get = function() return AutoGreed.db.profile.enabled end,
						set = function(_,v)
							AutoGreed.db.profile.enabled = v
						end
					},
					bopOnly = {
						order = o(),
						type = 'toggle',
						name = L['BOP only'],
						disabled = function() return not AutoGreed.db.profile.enabled end,
						get = function() return AutoGreed.db.profile.bopOnly end,
						set = function(_,v)
							AutoGreed.db.profile.bopOnly = v
						end
					},
					fivemenOnly = {
						order = o(),
						type = 'toggle',
						name = L['Five men only'],
						disabled = function() return not AutoGreed.db.profile.enabled end,
						get = function() return AutoGreed.db.profile.fivemenOnly end,
						set = function(_,v)
							AutoGreed.db.profile.fivemenOnly = v
						end
					},
					priceLimit = {
						order = o(),
						type = 'range',
						min = 0,
						max = 1000,
						softMin = 1,
						softMax = 20,
						step = .1,
						bigStep = 1,
						name = L['Price limit'],
						desc = L['Items whose sell price higher than this will NOT be rolled disenchant'],
						get = function() return AutoGreed.db.profile.priceLimit end,
						set = function(_,v)
							AutoGreed.db.profile.priceLimit = v
						end
					},
				}
		}, 6
)
