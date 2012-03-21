local L = {
	zhCN = "成就增强",
	zhTW = "成就增強",
	enUS = "Overachive",
}

wsRegisterOption("general", "Overachiever", "Overachiever", L[GetLocale()], "", "achievement_bg_masterofallbgs", function() 
		if SlashCmdList["Overachiever_silent"] then
			SlashCmdList["Overachiever_silent"]("");
		end
	end, nil, {
	"Overachiever_Tabs",
	"Overachiever_Trade"
});
