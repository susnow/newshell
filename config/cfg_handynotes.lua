local L = {
	zhCN = "大地图标记助手",
	zhTW = "大地圖標記助手",
	enUS = "HandyNotes",
}

wsRegisterOption("general", "HandyNotes", "HandyNotes", L[GetLocale()], "", "inv_misc_note_03", function()
	LibStub("AceConfigDialog-3.0"):Open("HandyNotes");
end)
