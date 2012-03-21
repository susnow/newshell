local L = {
	zhCN = "团队助手",
	zhTW = "團隊助手",
	enUS = "oRA3",
}

wsRegisterOption("raid", "oRA3", "oRA3", L[GetLocale()], L[GetLocale()], "Spell_Holy_DevineAegis", function()
	LibStub("AceConfigDialog-3.0"):Open("oRA3");	
end)

