local L = setmetatable(GetLocale() == 'zhTW' and {
    ['性感小地图'] = '性感小地圖',
    ['设置性感小地图'] = '設置性感小地圖',
		['启用'] = '啟用',
		['锁定'] = '鎖定',
		['显示锚点'] = '顯示錨點',
		['显示小地图信号'] = '顯示小地圖信號',
		['显示谁点了小地图'] = '顯示誰點了小地圖',
		['选择预置样式'] = '選擇預置樣式',
		['打开详细设置'] = '打開詳細設置',
} or {}, {__index = function(t, i)
    return i
end})

local empty_tbl = {}

local o
do
    local p = 0
    function o ()
        p = p + 1
        return p
    end
end

local function isDisabled()
    return not SexyMap
end

wsRegisterOption(
    'UserIn',
    'SexyMap',
		"SexyMap",
    L['性感小地图'],
    L['设置性感小地图'],
    "inv_misc_food_59",
    {
        type = 'group',
        args = {
            enabled = {
                order = o(),
                type = 'toggle',
                name = L['启用'],
                desc = L['启用性感小地图, 将在重载后生效'],
                get = function() return select(4, GetAddOnInfo'SexyMap') end,
                set = function(_,v)
                    if(v) then
                        EnableAddOn'SexyMap'
                        if(not IsAddOnLoaded'SexyMap') then
                            LoadAddOn'SexyMap'
                        end
                    else
                        DisableAddOn'SexyMap'
                        if(IsAddOnLoaded'SexyMap') then
                            StaticPopup_Show'WOWSHELL_UTIL_CONFIGCHANGED_RELOAD'
                        end
                    end
                end
            },

            lock = {
                order = o(),
                type = 'toggle',
                name = L['锁定'],
                desc = L['锁定/解锁小地图'],
                disabled = isDisabled,
                get = function() return SexyMap and (SexyMap:GetModule'General').db.profile.lock end,
                set = function(_, v)
                    local m = SexyMap:GetModule'General'
                    m.db.profile.lock = v
                    m:SetLock(v)
                end,
            },
            showmovers = {
                order = o(),
                type = 'toggle',
                name = L['显示锚点'],
                disabled = isDisabled,
                get = function() return SexyMap and (SexyMap:GetModule'General').db.profile.movers end,
                set = function(_,v )
                    local mod = SexyMap:GetModule'General'
                    mod.db.profile.movers = v
                    mod:SetMovers()
                end
            },
            showPing = {
                order = o(),
                type = 'toggle',
                name = L['显示小地图信号'],
                desc = L['显示谁点了小地图'],
                disabled = isDisabled,
                get = function() return SexyMap and (SexyMap:GetModule'Ping').db.profile.showPing end,
                set = function(_, v)
                    local m = SexyMap:GetModule'Ping'
                    m.db.profile.showPing = v
                end
            },
            presets = {
                type = 'select',
                name = L['选择预置样式'],
                order = o(),
                confirm = true,
                disabled = isDisabled,
                values = function() return (SexyMap and (SexyMap:GetModule'Borders').presets) or empty_tbl end,
                get = function() return '' end,
                --get = function() return SexyMap and (SexyMap:GetModule'Borders').selectedPreset end,
                set = function(_,v)
                    local mod = SexyMap:GetModule'Borders'
                    mod.selectedPreset = v
                    mod:ApplyPreset(v)
                end,
            },
            adv = {
                type = 'execute',
                name = L['打开详细设置'],
                order = o(),
                func = function()
                    LibStub('AceConfigDialog-3.0'):Open('SexyMap')
                end,
            },
        },
    },
    10
)
