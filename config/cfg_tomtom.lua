local L = {
	zhCN = "导航助手",
	zhTW = "導航助手",
	enUS = "TomTom",
}
wsRegisterOption("general", "TomTom", "TomTom", L[GetLocale()], L[GetLocale()], "ability_mage_coldasice", function()
	SlashCmdList["TOMTOM"]();
end);
