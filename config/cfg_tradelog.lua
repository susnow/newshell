local L = {
	zhCN = "交易历史记录",
	zhTW = "交易歷史記錄",
	enUS = "TradeLog",
}

wsRegisterOption("general", "TradeLog", "TradeLog", L[GetLocale()], L[GetLocale()], "inv_misc_bandage_17", function()
	if( TradeListFrame:IsVisible() ) then
		TradeListFrame:Hide();
	else
		TradeListFrame:Show();
	end
end);
