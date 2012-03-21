local L = {
	zhCN = "采集助手",
	zhTW = "採集助手",
	enUS = "GatherMate2",
}

wsRegisterOption("general", "GatherMate2", "GatherMate2", L[GetLocale()], L[GetLocale()], "Interface\\AddOns\\GatherMate2\\Artwork\\Icon.tga", function()
	SlashCmdList.GatherMate2()
end,nil, {
	"GatherMate2_Data",
});
