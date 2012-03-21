local L = {
	zhCN = "装备属性计算",
	zhTW = "裝備屬性計算",
	enUS = "RatingBuster",
}

wsRegisterOption("general", "RatingBuster", "RatingBuster", L[GetLocale()], L[GetLocale()], "Interface\\AddOns\\RatingBuster\\images\\Sigma", function()
	LibStub('AceConfigDialog-3.0'):Open"RatingBuster"
end);
