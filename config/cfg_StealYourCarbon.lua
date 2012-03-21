local L = {
	zhCN = "自动补购",
	zhTW = "自動補購",
	enUS = "StealYourCarbon",
}

wsRegisterOption("general", "StealYourCarbon", "StealYourCarbon", L[GetLocale()], L[GetLocale()], "Spell_Nature_Polymorph", function()
	InterfaceOptionsFrame_OpenToCategory(StealYourCarbon.configframe);
end);
