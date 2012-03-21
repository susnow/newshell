local L = {
	["zhCN"] = "额外动作条",
	["zhTW"] = "額外動作條",
	["enUS"] = "Wowshell_Skyer"
}
wsRegisterOption("general", "Wowshell_Skyer", "Wowshell_Skyer", L[GetLocale()], L[GetLocale()], "Spell_Misc_Emotionsad", function()
	LibStub("AceConfigDialog-3.0"):Open("Skylark");
end, 1);
