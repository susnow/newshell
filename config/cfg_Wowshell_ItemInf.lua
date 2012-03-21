local L = {
	zhCN = "物品信息",
	zhTW = "物品信息",
	enUS = "Wowshell_ItemInf",
}

wsQueueLoad("Wowshell_ItemInf", {"general", "Wowshell_ItemInf", "Wowshell_ItemInf", L[GetLocale()], L[GetLocale()], "INV_Misc_Gift_03"}, function()
	local wsItemInf = LibStub("AceAddon-3.0"):GetAddon("wsItemInf");
	wsRegisterOption("general", "Wowshell_ItemInf", "Wowshell_ItemInf", L[GetLocale()], L[GetLocale()], "INV_Misc_Gift_03", {
		type = "group",
		args = wsItemInf.options
	});
end);
