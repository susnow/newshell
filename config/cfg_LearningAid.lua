local L = {
	zhCN = "技能助手",
	zhTW = "技能助手",
	enUS = "LearningAid",
}

wsRegisterOption("general", "LearningAid", "LearningAid", L[GetLocale()], "LearningAid", "SPELL_HOLY_BORROWEDTIME", function()
	LibStub("AceConfigDialog-3.0"):Open("LearningAidConfig");	
end)

