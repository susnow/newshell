local L = {
	zhCN = "流线型法术冷却",
	zhTW = "流線型法術冷卻",
	enUS = "CoolLine",
}

wsRegisterOption("general", "CoolLine", "CoolLine", L[GetLocale()], "", "inv_throwingknife_06", function()
	SlashCmdList.COOLLINE();
end);
