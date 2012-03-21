local L = {
	zhCN = "稀有怪搜寻器",
	zhTW = "稀有怪搜尋器",
	enUS = "NPCScan",
}

wsRegisterOption("general", "_NPCScan", "_NPCScan", L[GetLocale()], L[GetLocale()], "ability_hunter_snipershot", function()
	_NPCScan.SlashCommand("")
end, 12, {
	"_NPCScan.Overlay"
});
