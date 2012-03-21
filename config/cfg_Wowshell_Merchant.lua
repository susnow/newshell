local L = {
	zhCN = "商人助手",
	zhTW = "商人助手",
	enUS = "Wowshell_Merchant",
}

wsQueueLoad("Wowshell_Merchant", {"general", "Wowshell_Merchant", "Wowshell_Merchant", L[GetLocale()], L[GetLocale()], "Trade_BlackSmithing"}, function()
	local merchant = LibStub("AceAddon-3.0"):GetAddon("wsMerchant");
	if not merchant.option then
		merchant:SetupOption();
	end
	wsRegisterOption("general", "Wowshell_Merchant", "Wowshell_Merchant", L[GetLocale()], L[GetLocale()], "Trade_BlackSmithing", {
		type = "group",
		args = merchant.option;
	});
end);
