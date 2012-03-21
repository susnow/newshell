local L = {
	zhCN = "团队报警系统",
	zhTW = "團隊報警系統",
	enUS = "RaidAlerter",
}

wsRegisterOption("raid", "RaidAlerter", "RaidAlerter", L[GetLocale()], L[GetLocale()], "achievement_guildperk_gmail", function()
	RaidAlerter_SlashCommand("")
end);
