local L = {
	zhCN = "一键驱散",
	zhTW = "一鍵驅散",
	enUS = "Decursive",
}

wsRegisterOption("raid", "Decursive", "Decursive", L[GetLocale()], L[GetLocale()], "Interface\\AddOns\\Decursive\\iconON", function()
	LibStub('AceConfigDialog-3.0'):Open("Decursive")
end);
