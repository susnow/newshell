local L = {
	zhCN = "组队频道转发",
	zhTW = "組隊頻道轉發",
	enUS = "LFGForwarder",
}

wsRegisterOption("general", "LFGForwarder", "LFGForwarder", L[GetLocale()], L[GetLocale()], "SPELL_HOLY_BORROWEDTIME", 120)

