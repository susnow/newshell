local L = {
	zhCN = {
		name = "触发技能提示",
		open = "打开设置面板",
	},
	zhTW = {
		name = "觸發技能提示",
		open = "打開設置面板",
	},
	enUS = {
			name = "EventAlertMod",
		open = "Open config options",
	},

}



wsRegisterOption("raid", "EventAlertMod", "EventAlertMod", L[GetLocale()].name, L[GetLocale()].name, "Interface\\AddOns\\EventAlertMod\\Images\\Seed1", {
	type = "group",
	args = {
		open = {
			name = L[GetLocale()].open,
			type = 'execute',
			func = function()
				if(EA_Options_Frame) then
					ShowUIPanel(EA_Options_Frame)
				end
			end,
		}
	}
});
