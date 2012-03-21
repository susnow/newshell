local L = {
	zhCN = {
		name = "ROLL点助手",
		desc = "合并ROLL点信息等一系列增强功能",
	},
	zhTW = {
		name = "ROLL點助手",
		desc = "合併ROLL點信息等一系列增強功能",
	},
	enUS = {
		name = "LookingForLoot",
		desc = "LookingForLoot",
	},
}

wsRegisterOption("raid","LookingForLoot", "LookingForLoot", L[GetLocale()].name, L[GetLocale()].desc,"INV_Misc_Dice_02", function()
	SlashCmdList["LOOKINGFORLOOT"]("")	
end, nil, nil, false);
