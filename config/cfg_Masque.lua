local L = {
	zhCN = "动作条皮肤美化",
	zhTW = "動作條皮膚美化",
	enUS = "Masque",
}

wsRegisterOption("general","Masque","Masque",L[GetLocale()],L[GetLocale()],"Inv_Misc_Tournaments_Tabard_Human",function()
	LibStub("AceConfigDialog-3.0"):Open("Masque")
end, 130)
