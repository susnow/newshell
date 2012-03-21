local L = {
	zhCN = "整合背包",
	zhTW = "整合背包",
	enUS = "Combuctor",
}

wsRegisterOption("general", "Combuctor", "combuctor", L[GetLocale()], "", "inv_misc_enggizmos_39", function()
		local name, desc = select(2, GetAddOnInfo('Combuctor'));	
		InterfaceOptionsFrame_Show();
		InterfaceOptionsFrame_OpenToCategory(name)
	end,  5, {
	"Combuctor_Config",
	"Combuctor_EquipmentSets",
	"Combuctor_Sets"
});
