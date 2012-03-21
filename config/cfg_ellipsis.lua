local L = {
	zhCN = "法术计时",
	zhTW = "法術計時",
	enUS = "Ellipsis",
}

wsRegisterOption("general", "Ellipsis", "Ellipsis", L[GetLocale()], L[GetLocale()], "Ability_Paladin_InfusionofLight", function()
		Ellipsis:OpenOptFrame()
	end, 9, {
	"Ellipsis_Options",
});
