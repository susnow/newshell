local _order = 0
function order()
	_order = _order + 1
	return _order
end

local L = {
	zhCN = {
		name = "一件换装",
		group = "一键换装设置面板",
		blash = "结合系统自带的换装功能做的增强一键换装, 设置方便, 使用简单. 不解释.",
		enabled = {
			name = "启用一键换装",
			desc = "启用/禁用一键换装插件",
		},
		equipBar = {
			name = "启用快速换装条",
			desc = "在玩家头像上方显示快速换装条",
		},
		showNum = {
			name = "显示换装按钮",
			desc = "设置换装条显示按钮个数",
		},
	},
	zhTW = {
		name = "一鍵換裝",
		group = "一鍵換裝設置面板",
		blash = "結合系統自帶的換裝功能做的增強一鍵換裝,設置方便,使用簡單.不解釋",
		enabled = {
			name = "啟用一鍵換裝",
			desc = "啟用/禁用一鍵換裝插件",
		},
		equipBar = {
			name = "啟用快速換裝條",
			desc = "在玩家頭像上方顯示快捷換裝條",
		},
		showNum = {
			name = "顯示換裝按鈕",
			desc = "設置換裝條顯示按鈕個數",
		},
	},
	enUS = {
		name = "quickEquip",
		group = "quickEquip Options",
		blash = "Improve quickEquip,easy to config, easy to use.Need'nt explanation",
		enabled = {
			name = "Enable quickEquip",
			desc = "Enable/Disable quickEquip",
		},
		equipBar = {
			name = "Enable quickEquipBar",
			desc = "Show the bar upper player's unit frames",
		},
		showNum = {
			name = "Enable quickEquipButtons",
			desc = "Set how many quickEquipButtons will show",
		},
	},
}


wsRegisterOption("General", "Wowshell_QuickEquip", "quickEquip", L[GetLocale()].name, "快速换装", "INV_Shirt_GuildTabard_01",
	{
			type = "group",
			name = L[GetLocale()].group,
			args = {
				blah = {
					type = 'description',
					fontSize = 'medium',
					order = order()+99999,
					name = L[GetLocale()].blash,
				},
				enabled = {
					type = "toggle",
					order = order(),
					name = L[GetLocale()].enabled.name,
					desc = L[GetLocale()].enabled.desc,
					get = function() return QuickEquip.db.profile.enabled end,
					set = function(_, v)
						QuickEquip.db.profile.enabled = v
						if v then
							QuickEquip:Enable()
						else
							QuickEquip:Disable()
						end
					end
				},
				equipBar = {
					type = "toggle",
					order = order(),
					name = L[GetLocale()].equipBar.name,
					desc = L[GetLocale()].equipBar.desc,
					width = "full",
					disabled = function() return not QuickEquip.db.profile.enabled end,
					get = function() return QuickEquip.db.profile.showBar end,
					set = function(_, v)
						QuickEquip.db.profile.showBar = v
						QuickEquip:UpdateShow()
					end,
				},
				showNum = {
					type = "range",
					order= order(),
					disabled = function() return not QuickEquip.db.profile.enabled end,
					name = L[GetLocale()].showNum.name,
					desc = L[GetLocale()].showNum.desc,
					min = 1,
					max = 8,
					step = 1,
					get = function() return QuickEquip.db.profile.equipbar.showNum end,
					set = function(_, v)
						QuickEquip.db.profile.equipbar.showNum = v
						QuickEquip:UpdateShow()
					end,
				},
			},
		},
12);

