local L = setmetatable(GetLocale() == 'zhCN' and {
    ['Dominos'] = '界面自定义 (多米诺)',
    ['A actionbar replacement'] = '原始动作条的替代品',
		['Domino'] = "动作条增强",

    ['Enable'] = '启用',
    ['Config mode'] = '设置模式',
    ['Toggle binding mode'] = '按键绑定模式',

    ['Sticky bars'] = '粘滞动作条',
    ['Lock action buttons'] = '锁定按钮',
    ['Show empty buttons'] = '显示空按钮',
    ['Show binding text'] = '显示快捷键文字',
    ['Show macro text'] = '显示宏名字',
    ['Show tooltips'] = '显示鼠标提示',
    ['Show tooltips in combat'] = '战斗中显示鼠标提示',
    ['Right click unit'] = '右键点击目标',
    ['none'] = '无',
    ['player'] = '玩家',
    ['targettarget'] = '目标的目标',
    ['focus'] = '焦点',
    ['Actionbar %d'] = '动作条 %d',
    ['Possess bar'] = '心灵控制条',

    ['Skin'] = '按钮皮肤',
    ['Set the skin for all buttons'] = '设置动作条按钮的皮肤',
    ['Disable Skin'] = '禁用皮肤',
    ['Disable the skins of all buttons'] = '禁用动作条按钮皮肤',
} or GetLocale() == 'zhTW' and {
    ['Dominos'] = '界面自定義 (多米諾)',
    ['A actionbar replacement'] = '原始動作條的替代品',
		['Domino'] = "動作條增強",

    ['Enable'] = '啟用',
    ['Lock/Unlock'] = '鎖定/解鎖',
    ['Toggle binding mode'] = '按鍵綁定模式',
    ['Open Dominos Option'] = '打開多米諾設置',
    ['Dominos'] = '動作條 - 多米諾',
    ['A actionbar replacement'] = '原始動作條的替代品',

		['Sticky bars'] = '粘滯動作條',
    ['Lock action buttons'] = '鎖定按鈕',
    ['Show empty buttons'] = '顯示空按鈕',
    ['Show binding text'] = '顯示快捷文字',
    ['Show macro text'] = '顯示宏名字',
    ['Show tooltips'] = '顯示鼠標提示',
    ['Show tooltips in combat'] = '戰鬥中顯示鼠標提示',
    ['Right click unit'] = '右鍵點擊目標',
    ['none'] = '無',
    ['player'] = '玩家',
    ['targettarget'] = '目標的目標',
    ['focus'] = '焦點',
    ['Actionbar %d'] = '動作條 %d',
    ['Possess bar'] = '心靈控制條',

    ['Skin'] = '按鈕皮膚',
    ['Set the skin for all buttons'] = '設置動作條按鈕的皮膚',
    ['Disable Skin'] = '禁用皮膚',
    ['Disable the skins of all buttons'] = '禁用動作條按鈕皮膚',
} or {}, { __index = function(t, i) t[i] = i; return i end })


local __order = 0
local getOrder = function()
    __order = __order + 1
    return __order
end

local playerClass = select(2, UnitClass'player')
local getDisabled = function()
    return not Dominos
end

local options = {}

wsRegisterOption("general", "Dominos", "Dominos", L['Domino'], L['Domino'], "Interface\\AddOns\\Dominos\\Dominos", {
    type = 'group',
    args = options,
}, 4, {
	"Dominos_Config",
	"Dominos_Roll",
	"Dominos_Totems",
	"Dominos_XP",
});

local f = CreateFrame'Frame'
f:RegisterEvent'PLAYER_LOGIN'
f:SetScript('OnEvent', function(self)
    -- destroy f
    self:SetScript('OnEvent', nil)
    self:UnregisterAllEvents()
    self:Hide()

    options.enable = {
        type = 'toggle',
        order = getOrder(),
        name = L['Enable'],
        get = function()
            return select(4, GetAddOnInfo'Dominos')
        end,
        set = function(_, v)
            local func = v and EnableAddOn or DisableAddOn
            func'Dominos'
            func'Dominos_Cast'
            func'Dominos_Config'
            func'Dominos_Roll'
            func'Dominos_XP'
            if(playerClass == 'SHAMAN') then
                func'Dominos_Totems'
            else
                DisableAddOn'Dominos_Totems'
            end
            wsPopup.CFG_RELOAD()
        end,
    }

    options.config_mode = {
        type = 'execute',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Config mode'],
        func = function()
            return Dominos and Dominos:ToggleLockedFrames()
        end,
    }

    options.binding_mode = {
        type = 'execute',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Toggle binding mode'],
        func = function()
            return Dominos and Dominos:ToggleBindingMode()
        end,
    }

    --local DL = LibStub('AceLocale-3.0'):GetLocale'Dominos-Config'
    options.stickyBars = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Sticky bars'],
        get = function()
            return Dominos and Dominos:Sticky()
        end,
        set = function(_,v)
            return Dominos and Dominos:SetSticky(v)
        end,
    }

    options.LockActionButtons = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Lock action buttons'],
        get = function()
            return LOCK_ACTIONBAR == '1'
        end,
        set = function()
            _G['InterfaceOptionsActionBarsPanelLockActionBars']:Click()
        end,
    }

    options.ShowEmptyButtons = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Show empty buttons'],
        get = function()
            return Dominos and Dominos:ShowGrid()
        end,
        set = function(_,v)
            return Dominos and Dominos:SetShowGrid(v)
        end,
    }

    options.ShowBindingText = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Show binding text'],
        get = function()
            return Dominos and Dominos:ShowBindingText()
        end,
        set = function(_,v)
            return Dominos and Dominos:SetShowBindingText(v)
        end,
    }

    options.ShowMacroText = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Show macro text'],
        get = function()
            return Dominos and Dominos:ShowMacroText()
        end,
        set = function(_,v)
            return Dominos and Dominos:SetShowMacroText(v)
        end,
    }

    options.ShowTooltips = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Show tooltips'],
        get = function()
            return Dominos and Dominos:ShowTooltips()
        end,
        set = function(_,v)
            return Dominos and Dominos:SetShowTooltips(v)
        end,
    }

    options.ShowTooltipsCombat = {
        type = 'toggle',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Show tooltips in combat'],
        get = function()
            return Dominos and Dominos:ShowCombatTooltips()
        end,
        set = function(_,v)
            return Dominos and Dominos:SetShowCombatTooltips(v)
        end,
    }

    options.RightClickUnit = {
        type = 'select',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Right click unit'],
        values = {
            ['none'] = L['none'],
            ['player'] = L['player'],
            ['targettarget'] = L['targettarget'],
            ['focus'] = L['focus'],
        },
        style = 'dropdown',
        get = function()
            return Dominos and Dominos:GetRightClickUnit() or 'none'
        end,
        set = function(_,v)
            return Dominos and Dominos:SetRightClickUnit(v~='none' and v)
        end,
    }

    local process_bars = {}
    for i = 1, 10 do
        process_bars[i] = string.format(L['Actionbar %d'], i)
    end
    options.PossessBar = {
        type = 'select',
        style = 'dropdown',
        order = getOrder(),
        disabled = getDisabled,
        name = L['Possess bar'],
        values = process_bars,
        get = function()
            return Dominos and Dominos:GetPossessBar().id
        end,
        set = function(_,v)
            return Dominos and Dominos:SetPossessBar(v)
        end,
    }

	if not IsAddOnLoaded("Masque") then return end
    local MSQ = LibStub('AceAddon-3.0'):GetAddon('Masque')
    if(not (MSQ and MSQ.Core)) then return end

    local Core = MSQ.Core
    local SkinList = Core.Button:ListSkins()
    local Global = Core.Button:Group()

    options.Skin = {
        type = 'select',
        order = getOrder(),
        name = L['Skin'],
        desc = L['Set the skin for all buttons'],
        style = 'dropdown',
        --width = 'full',
        disabled = getDisabled,
        values = SkinList,
        get = function()
            return Global.SkinID
        end,
        set = function(_,v)
            Global:__Skin(v, Global.Gloss, Global.Backdrop)
        end,
    }

    options.DisableSkin = {
        type = 'toggle',
        name = L['Disable Skin'],
        desc = L['Disable the skins of all buttons'],
        order = getOrder(),
        disabled = getDisabled,
        get = function()
            return Global.Disabled
        end,
        set = function(_, v)
            if(v) then
                Global:__Disable()
            else
                Global:__Enable()
            end
        end,
    }
end)

