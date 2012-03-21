local L = {
	zhCN = "图腾计时器",
	zhTW = "圖騰計時器",
	enUS = "TotemTimers",
}
wsRegisterOption("general", "TotemTimers", "TotemTimers", L[GetLocale()], L[GetLocale()], "Spell_Nature_Windfury", function()
	 TotemTimers_Slash();
end);
