local L = {
	zhCN = {
		name = "攻击计时条",
		desc = "近战远程攻击计时条",
	},
	zhTW = {
		name = "攻擊計時條",
		desc = "近戰遠程攻擊計時條",
	},
	enUS = {
		name = "Wowshell_Attackbar",
		desc = "Melee and remote's attack timer bar",
	},
}

wsQueueLoad("Wowshell_Attackbar", {"general","Wowshell_Attackbar", "Attackbar", L[GetLocale()].name, L[GetLocale()].desc,"ability_warrior_challange"}, function()
	local options = WSAttackbar.options;
	wsRegisterOption("general","Wowshell_Attackbar", "Attackbar", L[GetLocale()].name, L[GetLocale()].desc,"ability_warrior_challange", options);
end);
