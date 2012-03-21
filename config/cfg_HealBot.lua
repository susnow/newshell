local L = {
	zhCN = "治疗助手(HealBot)",
	zhTW = "治療助手(HealBot)",
	enUS = "HealBot",
}

wsRegisterOption("raid", "HealBot", "HealBot", L[GetLocale()], L[GetLocale()], "Spell_Holy_Chastise", function()
	HealBot_TogglePanel(HealBot_Options)
end)
