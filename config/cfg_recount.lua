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
		name = "伤害统计",
		show = "显示/隐藏",
		lock = "锁定位置",
		resetpos = "重置位置",
		resetdata = "清除数据",
	},
	zhTW = {
		name = "傷害統計",
		show = "顯示/隱藏",
		lock = "鎖定位置",
		resetpos = "重置位置",
		resetdata = "清除數據",
	},
	enUS = {
		name = "Recount",
		show = "Show/Hide",
		lock = "Lock position",
		resetpos = "Reset position",
		resetdata = "Clear position",
	},
}

wsRegisterOption("raid", "Recount", "Recount", L[GetLocale()].name, L[GetLocale()].name, "spell_shadow_psychicscream", {
	type = "group",
	args = {
		show = {
			type = 'execute',
			name = L[GetLocale()].show,
			order = o(),
			disabled = function() return not Recount end,
			func = function()
				if not (Recount and Recount.MainWindow) then return end
				if(Recount.MainWindow:IsShown()) then
					Recount.MainWindow:Hide()
				else
					Recount.MainWindow:Show()
					Recount:RefreshMainWindow()
				end
			end,
		},
		lock = {
			type = 'toggle',
			order = o(),
			name = L[GetLocale()].lock,
			disabled = function() return not Recount end,
			get = function() return Recount and Recount.db.profile.Locked end,
			set = function(_,v )
				if(not Recount) then return end
				Recount.db.profile.Locked = v
				Recount:LockWindows(v)
			end
		},
		resetpos = {
			type = 'execute',
			order = o(),
			name = L[GetLocale()].resetpos,
			disabled = function() return not Recount end,
			func = function()
				Recount:ResetPositions()
			end,
		},
		resetdata = {
			type = 'execute',
			name = L[GetLocale()].resetdata,
			order = o(),
			disabled = function() return not Recount end,
			confirm = true,
			func = function()
				Recount:ResetData()
			end,
		},

	}
});
