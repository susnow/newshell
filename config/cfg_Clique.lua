local L = {
	zhCN = "点击施法",
	zhTW = "點擊施法",
	enUS = "Clique",
}

wsRegisterOption("raid", "Clique", "Clique", L[GetLocale()], L[GetLocale()], "Interface\\AddOns\\Clique\\images\\icon_circle_128", function()
	WS_GUI:ToggleFrame(false)
	ShowUIPanel(CliqueConfig);	
end);
