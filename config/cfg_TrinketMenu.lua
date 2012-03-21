local L = {
	zhCN = "饰品管理器",
	zhTW = "飾品管理器",
	enUS = "TrinketMenu",
}

wsRegisterOption("general", "TrinketMenu", "TrinketMenu", L[GetLocale()], L[GetLocale()], "INV_Jewelcrafting_PurpleSerpent", function()
	TrinketMenu.ToggleFrame(TrinketMenu_OptFrame);
end);
