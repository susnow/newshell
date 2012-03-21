local L = {
	zhCN = "重铸助手",
	zhTW = "重鑄助手",
	enUS = "ReforgeLite",
}

wsRegisterOption("general", "ReforgeLite", "ReforgeLite", L[GetLocale()], L[GetLocale()], "Interface\\Reforging\\Reforge-Portrait", function() end, 5);
