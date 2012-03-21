local L = {
	zhCN = "VuhDo治疗助手",
	zhTW = "VuhDo治療助手",
	enUS = "VuhDo",
}

wsRegisterOption("raid", "VuhDo", "VuhDo", L[GetLocale()], L[GetLocale()], "Spell_Holy_Chastise", function()
	VUHDO_slashCmd'opt';
end, nil, {
	"VuhDoOptions",
});
