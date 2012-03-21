local o
do
    local p = 0
    function o ()
        p = p + 1
        return p
    end
end

local isEnabled = function ( addon )
    return select(4, GetAddOnInfo(addon))
end

local L = {
	zhCN = {
		name = "仇恨统计 Omen",
		enabled = "启用",
		toggle = "显示/隐藏 Omen",
		center = "重置位置",
		config = "打开高级设置",
	},
	zhTW = {
		name = "仇恨統計 Omen",
		enabled = "啟用",
		toggle = "顯示/隱藏 Omen",
		center = "重置位置",
		config = "打開高級設置",
	},
	enUS = {
		name = "Omen",
		enabled = "Enable",
		toggle = "Show/Hide Omen",
		center = "Reset position",
		config = "Open andanved config",
	},
}


wsRegisterOption("raid", "omen", "omen", L[GetLocale()].name, L[GetLocale()].name, [[Interface\AddOns\Omen\icon]], 
{
		type = 'group',
		args = {
				enabled = {
						type = 'toggle',
						order = o(),
						name = L[GetLocale()].enabled,
						get = function() return isEnabled('Omen') end,
						set = function(_,v)
								if(v) then
										EnableAddOn('Omen')
								else
										DisableAddOn'Omen'
								end
								StaticPopup_Show'WOWSHELL_UTIL_CONFIGCHANGED_RELOAD'
						end
				},
				toggle = {
						type = 'execute',
						order = o(),
						name = L[GetLocale()].toggle,
						disabled = function() return not Omen end,
						func = function()
								Omen:Toggle()
						end
				},
				center = {
						type = 'execute',
						name = L[GetLocale()].center,
						disabled = function() return not Omen end,
						order = o(),
						func = function()
								Omen.Anchor:ClearAllPoints()
								Omen.Anchor:SetPoint('CENTER', UIParent, 'CENTER')
								Omen:SetAnchors()
						end
				},
				config = {
						type = 'execute',
						name = L[GetLocale()].config,
						order = o(),
						disabled = function() return not Omen end,
						func = function()
								Omen:ShowConfig()
						end
				},
		},
});
