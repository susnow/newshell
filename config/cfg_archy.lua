local L = {
	zhCN = "考古助手",
	zhTW = "考古助手",
	enUS = "Archy",
}

wsRegisterOption(
	"general",
	"Archy",
	"Archy",
	L[GetLocale()],
	"",
	"trade_archaeology",
	function()
			LibStub("AceConfigDialog-3.0"):SetDefaultSize("Archy", 650, 580)
			if not (LibStub("AceConfigDialog-3.0"):Close("Archy")) then
					LibStub("AceConfigDialog-3.0"):Open("Archy")
			end
	end
)
