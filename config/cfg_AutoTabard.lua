local L = {
	zhCN = {
		name = "战袍助手",
		desc = "根据设置自动切换战袍",
	},
	zhTW = {
		name = "戰袍助手",
		desc = "根據設置自動切換戰袍",
	},
	enUS = {
		name = "AutoTabard",
		desc = "AutoTabard",
	},
}

wsRegisterOption("general","AutoTabard", "AutoTabard", L[GetLocale()].name, L[GetLocale()].desc,"Inv_Misc_Tournaments_Tabard_Tauren", function()
	SlashCmdList["AUTOTABARD"]("")
end, nil, nil, false);
