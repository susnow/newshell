local o
do
	local p = 0
	function o ()
		p = p + 1
		return p
	end
end

local L = {
	zhCN = {
		name = "首领报警(DBM)",
		moveme = "移动计时条",
		toggleRange = "显示/隐藏距离监视器",
		adv = "打开设置面板",
		advDesc = "打开更详细的设置面板",
	},
	zhTW = {
		name = "首領報警(DBM)",
		moveme = "移動計時條",
		toggleRange = "顯示/隱藏距離監視器",
		adv = "打開設置面板",
		advDesc = "打開更詳細的設置面板",
	},
	enUS = {
		name = "DBM",
		moveme = "move the timer bar",
		toggleRange = "Show/Hide rangeBar",
		adv = "Open config options",
		advDesc = "Open advance config options",
	},
}



wsRegisterOption("raid", "DBM-Core", "DBM", L[GetLocale()].name, "", "Interface\\AddOns\\DBM-Core\\textures\\Minimap-Button-Up", {
		type = 'group',
		args = {
				moveme = {
						name = L[GetLocale()].moveme,
						order = o(),
						type = 'execute',
						disabled = function() return not DBM end,
						func = function()
								if(DBM and DBM.Bars and DBM.Bars.ShowMovableBar) then
										DBM.Bars:ShowMovableBar()
								end
								-- need to modify DBM
								--if(not DBM_MOVEME) then
								--    DBM:LoadGUI()
								--    DBM_GUI:ShowHide(false)
								--end
								--if(DBM_MOVEME) then
								--    DBM_MOVEME()
								--end
						end,
				},
				toggleRange = {
						name = L[GetLocale()].toggleRange,
						type = 'execute',
						order = o(),
						disabled = function() return not DBM end,
						func = function()
								if(DBM) then
										if(DBM.RangeCheck:IsShown()) then
												DBM.RangeCheck:Hide()
										else
												DBM.RangeCheck:Show()
										end
								end
						end,
				},
				adv = {
						name = L[GetLocale()].adv,
						desc = L[GetLocale()].advDesc,
						order = o(),
						disabled = function() return not DBM end,
						type = 'execute',
						func = function()
								if(DBM) then
										DBM:LoadGUI()
								end
						end,
				},
		},
}
	, nil, {
	"DBM-GUI",
	"DBM-BaradinHold",
	"DBM-BastionTwilight",
	"DBM-BlackwingDescent",
	"DBM-ChamberOfAspects",
	"DBM-Coliseum",
	"DBM-EyeOfEternity",
	"DBM-Icecrown",
	"DBM-Naxx",
	"DBM-Onyxia",
	"DBM-Party-Cataclysm",
	"DBM-Party-WotLK",
	"DBM-PvP",
	"DBM-RaidLeadTools",
	"DBM-ThroneFourWinds",
	"DBM-Ulduar",
	"DBM-VoA",
	"DBM-WorldEvents",
	"DBM-Firelands"
});
