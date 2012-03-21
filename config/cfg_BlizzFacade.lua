local L = {
	zhCN = "暴雪动作条按钮美化",
	zhTW = "暴雪動作條按鈕美化",
	enUS = "BlizzFacade",
}

wsRegisterOption("general", "BlizzFacade", "BlizzFacade", L[GetLocale()], L[GetLocale()], "INV_Misc_EngGizmos_29",
function()
	LibStub('AceConfigDialog-3.0'):Open("BlizzFacade")	
end);
