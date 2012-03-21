local LL = setmetatable(GetLocale() == 'zhCN' and {
	['Reset'] = '重置配置',
	['Reset user settings, including positions, etc..'] = "重置用户配置为默认, 包括地图位置等",
} or GetLocale() == 'zhTW' and {
	['地图增强'] = '地圖增強',
	['大地图增强, 提供缩放, 移动等功能'] = '大地圖增強, 提供縮放, 移動等功能',
	['Reset'] = '重置檔案',
	['Reset user settings, including positions, etc..'] = '重置此插件的配置檔案',
} or {}, {__index = function(t, i) return i end})


wsQueueLoad("Mapster", {'general', "Mapster", 'Mapster' ,	LL['地图增强'], LL['大地图增强, 提供缩放, 移动等功能'], [[inv_misc_map09]] }, function()
	local Mapster = LibStub("AceAddon-3.0"):GetAddon("Mapster")
	local L = LibStub("AceLocale-3.0"):GetLocale("Mapster")

	local optGetter, optSetter
	do
		function optGetter(info)
			local key = info[#info]
			if key:sub(0,5) == "mini_" then
				return Mapster.db.profile.mini[key:sub(6)]
			else
				return Mapster.db.profile[key]
			end
		end

		function optSetter(info, value)
			local key = info[#info]
			if key:sub(0,5) == "mini_" then
				Mapster.db.profile.mini[key:sub(6)] = value
			else
				Mapster.db.profile[key] = value
			end
			Mapster:Refresh()
		end
	end

	wsRegisterOption(
		'general',
		"Mapster",
		'Mapster',
		LL['地图增强'],
		LL['大地图增强, 提供缩放, 移动等功能'],
		[[inv_misc_map09]],
		{
			type = 'group',
			args = {
				alpha = {
					order = 3,
					name = L["Alpha"],
					desc = L["The transparency of the big map."],
					type = "range",
					min = 0, max = 1, bigStep = 0.01,
					isPercent = true,
					get = optGetter,
					set = optSetter,
				},
				mini_alpha = {
					order = 4,
					name = L["Minimized Alpha"],
					desc = L["The transparency of the minimized map."],
					type = "range",
					min = 0, max = 1, bigStep = 0.01,
					isPercent = true,
					get = optGetter,
					set = optSetter,
				},
				scale = {
					order = 6,
					name = L["Scale"],
					desc = L["Scale of the big map."],
					type = "range",
					min = 0.1, max = 2, bigStep = 0.01,
					isPercent = true,
					get = optGetter,
					set = optSetter,
				},
				mini_scale = {
					order = 7,
					name = L["Minimized Scale"],
					desc = L["Scale of the minimized map."],
					type = "range",
					min = 0.1, max = 2, bigStep = 0.01,
					isPercent = true,
					get = optGetter,
					set = optSetter,
				},
				arrowScale = {
					order = 11,
					name = L["PlayerArrow Scale"],
					desc = L["Adjust the size of the Player Arrow on the Map for better visibility."],
					type = "range",
					min = 0.5, max = 2, bigStep = 0.01,
					isPercent = true,
					get = optGetter,
					set = optSetter,
				},
				poiScale = {
					order = 12,
					type = "range",
					name = L["POI Scale"],
					desc = L["Scale of the POI Icons on the Map."],
					min = 0.1, max = 2, bigStep = 0.01,
					isPercent = true,
					get = optGetter,
					set = optSetter,
				},
				fogClear = {
					order = 15,
					type = 'toggle',
					name = L['Enable FogClear'],
					get = function() return Mapster:GetModuleEnabled('FogClear') end,
					set = function(_, v)
						Mapster:SetModuleEnabled('FogClear', v)
					end,
				},
				fc_color = {
					order = 17,
					type = 'color',
					name = L['Overlay Color'],
					hasAlpha = true,
					get = function()
						local fc = Mapster:GetModule'FogClear'
						local db = fc.db.profile
						return db.colorR, db.colorG, db.colorB, db.colorA
					end,
					set = function(info, r,g,b,a)
						local fc = Mapster:GetModule'FogClear'
						local db = fc.db.profile
						db.colorR, db.colorG, db.colorB, db.colorA = r,g,b,a
					end,
				},
				reset = {
					order = 50,
					name = LL['Reset'],
					desc = LL['Reset user settings, including positions, etc..'],
					type = 'execute',
					confirm = true,
					func = function()
						Mapster.db:ResetProfile()
					end,
				},
			},
		})
end);
--[=[

]=]
