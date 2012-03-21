local L = {
	zhCN = "任务助手",
	zhTW = "任務助手",
	enUS = "Wowshell_Quest",
}

wsQueueLoad("Wowshell_Quest", {"general", "Wowshell_Quest", "Wowshell_Quest", L[GetLocale()], L[GetLocale()], "Achievement_Quests_Completed_08", 3}, function()
	local wsQuest = LibStub("AceAddon-3.0"):GetAddon("wsQuest");
	if not wsQuest.option then
		wsQuest:SetupOption();
	end
	wsRegisterOption("general", "Wowshell_Quest", "Wowshell_Quest", L[GetLocale()], L[GetLocale()], "Achievement_Quests_Completed_08", {
		type = "group",
		args = wsQuest.option
	}, 3);
end)
