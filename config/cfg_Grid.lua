local L = {
	zhCN = "团队框架",
	zhTW = "團隊框架",
	enUS = "Grid",
}

wsRegisterOption("raid", "Grid", "Grid", L[GetLocale()], L[GetLocale()], "Interface\\AddOns\\Grid\\icon", function()
		LibStub('AceConfigDialog-3.0'):Open'Grid'
end, nil, {
	"GridStatusRaidDebuff",
	"GridStatusRD_Cata",
});
