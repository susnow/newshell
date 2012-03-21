local L = {
	zhCN = "小队施法",
	zhTW = "小隊施法",
	enUS = "Wowshell_PartyCast",
}
wsRegisterOption("general", "Wowshell_PartyCast", "Wowshell_PartyCast", L[GetLocale()], L[GetLocale()], "INV_Misc_ShadowEgg", function()
	LibStub("AceConfigDialog-3.0"):Open("PartyCast")	
end, 16);
