local L = {
	zhCN = {
		name = "商业技能百科",
		openlibs = "打开商业技能百科库",
		openconfig = "设置面板",
	},
	zhTW = {
		name = "商業技能百科",
		openlibs = "打開商業技能百科庫",
		openconfig = "設置面板",
	},
	enUS = {
		name = "TradeskillInfo",
		openlibs = "open TradeskillInfo",
		openconfig = "config options",
	},
}

wsRegisterOption("general", "TradeskillInfo", "TradeskillInfo", L[GetLocale()].name, L[GetLocale()].name, "INV_Elemental_Mote_Nether", {
	type = "group",
	args = {
		openlibs = {
			type = "execute",
			name = L[GetLocale()].openlibs,
			func = function()
				TradeskillInfo:ChatCommand("");
			end
		},
		openconfig = {
			type = "execute",
			name = L[GetLocale()].openconfig,
			func = function()
				TradeskillInfo:ChatCommand("config");
			end
		}
	}
}, nil, {
	"TradeskillInfoUI",
});
