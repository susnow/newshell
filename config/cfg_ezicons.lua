local L = {
	zhCN = "标记助手",
	zhTW = "標記助手",
	enUS = "ezIcons",
}

wsRegisterOption("general", "ezIcons", "ezIcons", L[GetLocale()], L[GetLocale()], "ability_hunter_mastermarksman", function()
	LibStub("AceConfigDialog-3.0"):Open("ezIcons");	
end);
