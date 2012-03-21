local L = {
	zhCN = "个人会计",
	zhTW = "個人會計",
	enUS = "Accountant_Classic",
}


wsRegisterOption("general", "Accountant_Classic", "Accountant_Classic", L[GetLocale()], "", "inv_misc_lantern_01", function()
	Accountant_Slash("");
end);
