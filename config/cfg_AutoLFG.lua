local L = {
	zhCN = {
		name = "随机本助手",
		desc = "随机本队列自动确认",
	},
	zhTW = {
		name = "隨機本助手",
		desc = "隨機本隊列自動確認",
	},
	enUS = {
		name = "AutoLFG",
		desc = "AutoLFG",
	},
}

wsQueueLoad("AutoLFG", {"raid","AutoLFG", "AutoLFG", L[GetLocale()].name, L[GetLocale()].desc,"Achievement_Boss_CThun"}, function()
	local options = ALFG.options;
	wsRegisterOption("raid","AutoLFG", "AutoLFG", L[GetLocale()].name, L[GetLocale()].desc,"Achievement_Boss_CThun", options, nil, nil, false);
end);
