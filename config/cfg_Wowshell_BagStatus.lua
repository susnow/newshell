local options
local _order = 0

local function order()
	_order = _order + 1
	return _order
end

local function getOptions()
	local L = wsLocale:GetLocale("BagStatus")
	local db = BagStatus.db.profile
	local self = BagStatus
	if not options then
		options = {
			type = "group",
			name = L["背包状态管理"],
			args = {
				bagStausBar = {
					type = "toggle",
					name = L["显示背包状态"],
					desc = L["在每个背包上显示该背包的使用率"],
					order = order(),
					get = function() return db.showBagStatus end,
					set = function(_, v) 
						db.showBagStatus = v
						self:OnProfileChanged()
					end
				},
				setalpha = {
					type = "range",
					name = L["设置背包状态透明度"],
					desc = L["设置每个背包状态条的透明度"],
					order = order(),
					min = 0,
					max = 100,
					step = 1,
					width = "full",
					get = function() return db.BagStatusAlpha*100 end,
					set = function(_, v)
						db.BagStatusAlpha = v/100,
						self:OnProfileChanged()
					end
				},
				bettercount = {
					type = "toggle",
					name = L["计数修正"],
					desc = L["大于999用#.#K显示"],
					order = order(),
					width = "full",
					get = function() return db.CountAbb end,
					set = function(_, v)
						db.CountAbb = v
						self:OnProfileChanged()
					end
				},
			},
		}
	end
	return options
end

local LL = {
	zhCN = {
		name = "背包状态",
		desc = "背包状态及背包一键打开",
	},
	zhTW = {
		name = "背包狀態",
		desc = "背包狀態及背包一鍵打開",
	},
	enUS = {
		name = "Wowshell_BagStatus",
		desc = "Bags status and open all bags"
	},
}

wsQueueLoad("Wowshell_BagStatus", {"general", "Wowshell_BagStatus", "BagStatusOptions", LL[GetLocale()].name, LL[GetLocale()].desc, "INV_Misc_Bag_14"}, function()
	wsRegisterOption(
		"general",
		"Wowshell_BagStatus",
		"BagStatusOptions",
		LL[GetLocale()].name,
		LL[GetLocale()].desc,
		"INV_Misc_Bag_14",
		getOptions(),
		3
	);
end)
