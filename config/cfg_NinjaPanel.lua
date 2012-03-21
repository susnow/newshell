local L = setmetatable(GetLocale() == 'zhCN' and {
    ['NinjaPanel'] = '忍者信息条',
    ['NinjaPanel info bar'] = '小巧的信息条显示插件',
    ['Plugins'] = '信息插件',
    ['Enable'] = '启用',
    ['Bottom bar'] = '底部显示',
    ['Set the bar on the bottom instead of top'] = '将信息条显示在屏幕底部',
} or GetLocale() == 'zhTW' and {
    ['NinjaPanel'] = '忍者信息條',
    ['NinjaPanel info bar'] = '小巧的信息條顯示插件',
    ['Plugins'] = '信息插件',
    ['Enable'] = '啟用',
    ['Bottom bar'] = '底部顯示',
    ['Set the bar on the bottom instead of top'] = '將信息條顯示在屏幕底部',
} or {}, { __index = function(t,i)
    t[i] = i
    return i
end})

local getOrder
do
    local o = 0
    getOrder = function()
        o = o + 1
        return o
    end
end

local plugin_name_locale = setmetatable(GetLocale() == 'zhCN' and {
    wsBagStatus = '背包',
    Broker_Mail = '邮件',
    Broker_Location = '地区及坐标',
    picoEXP = '经验',
    Broker_Equipment = '套装',
    BrokerCPU = '性能',
    tekability = '耐久度',
    MoneyTrail = '金币',
    pStats = '性能',
    Broker_WorldPVPTimer = '世界PvP',
} or GetLocale() == 'zhTW' and {
    wsBagStatus = '背包',
    Broker_Mail = '郵件',
    Broker_Location = '地區及座標',
    picoEXP = '經驗',
    Broker_Equipment = '套裝',
    BrokerCPU = '性能',
    tekability = '耐久度',
    MoneyTrail = '金幣',
    pStats = '性能',
    Broker_WorldPVPTimer = '世界PvP',
} or {}, { __index = function(t, i)
    local name
    if(i) then
        _, name = GetAddOnInfo(i)
    end
    t[i] = name or i
    return t[i]
end})

local plugins = {}
local getPlugins = function()
    table.sort(NinjaPanel.pluginNames)
    wipe(plugins)

    for _, name in ipairs(NinjaPanel.pluginNames) do
        plugins[name] = plugin_name_locale[name]
    end

    return plugins
end

local plugins_get = function(_, name)
    local opts = NinjaPanelDB.plugins[name]
    return not opts.disabled
end

local plugins_set = function(_, name, value)
    local opts = NinjaPanelDB.plugins[name]
    opts.disabled = not value

    StaticPopup_Show'WOWSHELL_UTIL_CONFIGCHANGED_RELOAD'
end

wsRegisterOption(
    'general',
    'NinjaPanel',
    'NinjaPanel',
    L['NinjaPanel'],
    L['NinjaPanel info bar'],
    'Interface\\AddOns\\NinjaPanel\\NinjaLogo',
    {
        type = 'group',
        args = {
            enabled = {
                name = L['Enable'],
                type = 'toggle',
                order = getOrder(),
                get = function() return true end,
                set = function(_, v)
                    if(not v) then
                        DisableAddOn'NinjaPanel'
                        StaticPopup_Show'WOWSHELL_UTIL_CONFIGCHANGED_RELOAD'
                    end
                end,
            },
            BOTTOM = {
                name = L['Bottom bar'],
                desc = L['Set the bar on the bottom instead of top'],
                type = 'toggle',
                order = getOrder(),
                get = function() return NinjaPanelDB.BOTTOM end,
                set = function(_,v)
                    NinjaPanelDB.BOTTOM = v
                    StaticPopup_Show'WOWSHELL_UTIL_CONFIGCHANGED_RELOAD'
                end,
            },
            plugins = {
                name = L['Plugins'],
                type = 'multiselect',
                values = getPlugins,
                get = plugins_get,
                set = plugins_set,
            }
        },
    }
)
