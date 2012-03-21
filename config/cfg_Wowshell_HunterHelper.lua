local L = {
	zhCN = "猎人助手",
	zhTW = "獵人助手",
	enUS = "Wowshell_HunterHelper",
}

wsRegisterOption("general", "Wowshell_HunterHelper", "Wowshell_HunterHelper", L[GetLocale()], L[GetLocale()], "Ability_Hunter_FocusFire", function()
	LibStub("AceConfigDialog-3.0"):Open("IceHunex")	
end);
