local L = {
	zhCN = "任务成就党",
	zhTW = "任務成就黨",
	enUS = "QuestHubber",
}

wsRegisterOption("general", "QuestHubber", "QuestHubber", L[GetLocale()], L[GetLocale()], "achievement_general_25kdailyquests", function()
	LibStub("AceConfigDialog-3.0"):Open("QuestHubber");	
end);
